#             _ _     _       _ _   
#    __ _  __| | |__ (_)_ __ (_) |_ 
#   / _` |/ _` | '_ \| | '_ \| | __|
#  | (_| | (_| | |_) | | | | | | |_ 
# (_)__, |\__,_|_.__/|_|_| |_|_|\__|
#   |___/                           


# Set assembly syntax intel
set disassembly-flavor intel

# Disable asking for downloading debuginfo from URL
set debuginfod enabled off


### LAYOUTS ###

# asmr = asm + regs
tui new-layout asmr {-horizontal asm 4 regs 3} 3 status 0 cmd 1

# full = src + asm + regs
tui new-layout full {src 1 asm 1 regs 1} 4 status 0 cmd 1

# fullh = horizontal (src + asm + regs)
tui new-layout fullh {-horizontal src 6 asm 4 regs 4} 3 status 0 cmd 1

# fullc = src + horizontal (asm + regs)
tui new-layout fullc {src 1 {-horizontal asm 4 regs 3} 1} 3 status 0 cmd 1

