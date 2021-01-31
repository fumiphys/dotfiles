" automatically create compile_flags.txt
let s:compile_flag_file = getcwd() . "/compile_flags.txt"
let s:compile_options = ["-I/usr/local/include", "-I/Library/Developer/CommandLineTools/usr/include/c++/v1", "-std=c++14"]
if ! filereadable(s:compile_flag_file)
  call writefile(s:compile_options, s:compile_flag_file)
endif
