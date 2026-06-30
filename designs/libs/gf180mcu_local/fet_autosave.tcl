# fet_autosave.tcl  --  auto-generate ngspice .save lines for every FET in a design
#
# Ported to GF180MCU from the sky130A PDK xschemrc (Stefan Schippers' xschem).
# It adds a "GF180" menu with "Create FET .save file": one click walks the whole
# schematic hierarchy, finds every nfet/pfet, and writes a <schematic>.save file
# containing the .save lines for each device's gm and id. You then add
#   .include <schematic>.save
# to the testbench, run OP, and Annotate (Ctrl+I) to see gm/id on all of them.
#
# Only write_save_lines is PDK-specific: GF180 FET subckts wrap a single mosfet
# named m0, so the device handle is @m.<path><spiceprefix><name>.m0.
# sch_expand / hier_sch_expand / save_fet_params are copied verbatim (generic).

if {![info exists nolist_libs]} { set nolist_libs {} }

# writes the .save instructions for a given GF180 FET instance.
# Saves the full gm/ID design set (all verified available in the GF180 BSIM
# model). In the raw they appear as: i(...[id]) (current), v(...[vth]) /
# v(...[vdsat]) (voltage), and bare ...[gm] / ...[cgg] (conductance/capacitance).
# Only id/gm are shown by the patched symbols; the rest are for gm/ID analysis
# (gm/gds intrinsic gain, ft = gm/(2*pi*cgg), gmbs body effect, region, etc.).
proc write_save_lines {type model schpath spiceprefix instname} {
  global sch_expand
  if {[regexp {[pn]mos} $type]} {
    # GF180 nfet_*/pfet_* subckts contain one mosfet called m0
    set devpath [string tolower @m.$schpath$spiceprefix$instname.m0]
    foreach p {id gm gds gmbs vth vdsat cgg cgs cgd cdd} {
      append sch_expand(savelist) ".save $devpath\[$p\]\n"
    }
  }
}

############ sch_expand
# This proc traverses the hierarchy and prints all instances in design.
proc sch_expand {{only_subckts 1} {all_hierarchy 1} {pattern {.*}}} {
  global sch_expand keep_symbols
  set sch_expand(savelist) {}
  set sch_expand(only_subckts) $only_subckts
  set sch_expand(all_hierarchy) $all_hierarchy
  set sch_expand(startpath) [string length [xschem get sch_path]]
  set save_keep $keep_symbols
  set keep_symbols 1
  xschem unselect_all
  xschem set no_draw 1 ;# disable screen update
  xschem set no_undo 1 ;# disable undo

  hier_sch_expand 0 $only_subckts $all_hierarchy $pattern

  xschem set no_draw 0
  xschem set no_undo 0
  set keep_symbols $save_keep
  return {}
}

# recursive procedure used by sch_expand
proc hier_sch_expand {{level 0} {only_subckts 0} {all_hierarchy 1} {pattern {.*}}} {
  global nolist_libs sch_expand

  set schpath [string range [xschem get sch_path] $sch_expand(startpath) end]
  set instances  [xschem get instances]
  for {set i 0} { $i < $instances} { incr i} {
    set instname [xschem getprop instance $i name]
    set symbol [xschem getprop instance $i cell::name]
    set spiceprefix [xschem getprop instance $i spiceprefix]
    set model [xschem translate $instname @model]
    set abs_symbol [abs_sym_path $symbol]
    set type [xschem getprop symbol $symbol type]

    if {$only_subckts && ($type ne {subcircuit})} { continue }
    set skip 0
    foreach j $nolist_libs {
      if {[regexp $j $abs_symbol]} {
        set skip 1
        break
      }
    }
    if {$skip} { continue }
    if {$type ne {subcircuit} && ![regexp $pattern $symbol]} {
      continue
    }

    write_save_lines $type $model $schpath $spiceprefix $instname

    if {$type eq {subcircuit} && $all_hierarchy} {
      set ninst [lindex [split [xschem expandlabel $instname] { }] 1]
      for {set n 1} {$n <= $ninst} { incr n} {
        if {$n == 1} {
          xschem select instance $i
          set res [xschem descend $n 2]
          # ensure previous descend was successful
          if {$res} {
            incr level
          } else { ;# descended into a blank schematic. Go back.
            xschem go_back 2
            puts "Can not descend into $instname"
            break
          }
        }
        if {$n > 1} {
          xschem change_sch_path $n
        }
        set dp [hier_sch_expand $level $only_subckts 1 $pattern]
        if {$n == $ninst} {
          xschem go_back 2
          incr level -1
        }
      }
    }
  }
  return 1
}
############ /sch_expand

# generate the .save lines to save all mos parameters
proc save_fet_params {} {
  global sch_expand
  sch_expand 0 1 {[pn]fet}
  return "* Place this .save file with a .include line in your testbench\n\n$sch_expand(savelist)"
}

# add a GF180 menu entry with "Create FET .save file"
proc menu_gf180 {} {
  global has_x netlist_dir
  if { [info exist has_x] } {
    set topwin [xschem get top_path]
    # don't add the menu twice if this runs again on a new window
    if {[winfo exists $topwin.menubar.gf180]} { return }

    # insert before the 'Netlist' menu
    $topwin.menubar insert Netlist cascade -label GF180 -menu $topwin.menubar.gf180
    menu $topwin.menubar.gf180 -tearoff 0

    $topwin.menubar.gf180 add command -label {Create FET .save file} -command {
      write_data [save_fet_params] $netlist_dir/[file rootname [file tail [xschem get current_name]]].save
      textwindow $netlist_dir/[file rootname [file tail [xschem get current_name]]].save
    }
  }
}

# run menu_gf180 after each new window creation (append, don't clobber the PDK's)
if {![info exists user_startup_commands]} { set user_startup_commands {} }
append user_startup_commands "\nmenu_gf180\n"
