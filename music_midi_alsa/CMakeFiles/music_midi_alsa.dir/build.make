# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pi/solution/basis

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/solution/basis

# Include any dependencies generated for this target.
include operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/depend.make

# Include the progress variables for this target.
include operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/progress.make

# Include the compile flags for this target's objects.
include operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/flags.make

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.gch: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/flags.make
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.gch: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.cxx
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.gch: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/solution/basis/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.gch"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -x c++-header -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -o CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.gch -c /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.cxx

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.i"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -x c++-header -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -E /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.cxx > CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.i

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.s"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -x c++-header -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -S /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.cxx -o CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.s

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/_.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/flags.make
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/_.cpp.o: operating-system/operating-system-linux/music_midi_alsa/_.cpp
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/_.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/_.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.gch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/solution/basis/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/_.cpp.o"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -o CMakeFiles/music_midi_alsa.dir/_.cpp.o -c /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/_.cpp

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/_.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/music_midi_alsa.dir/_.cpp.i"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -E /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/_.cpp > CMakeFiles/music_midi_alsa.dir/_.cpp.i

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/_.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/music_midi_alsa.dir/_.cpp.s"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -S /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/_.cpp -o CMakeFiles/music_midi_alsa.dir/_.cpp.s

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/_factory.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/flags.make
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/_factory.cpp.o: operating-system/operating-system-linux/music_midi_alsa/_factory.cpp
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/_factory.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/_factory.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.gch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/solution/basis/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/_factory.cpp.o"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -o CMakeFiles/music_midi_alsa.dir/_factory.cpp.o -c /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/_factory.cpp

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/_factory.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/music_midi_alsa.dir/_factory.cpp.i"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -E /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/_factory.cpp > CMakeFiles/music_midi_alsa.dir/_factory.cpp.i

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/_factory.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/music_midi_alsa.dir/_factory.cpp.s"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -S /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/_factory.cpp -o CMakeFiles/music_midi_alsa.dir/_factory.cpp.s

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/midi.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/flags.make
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/midi.cpp.o: operating-system/operating-system-linux/music_midi_alsa/midi.cpp
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/midi.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/midi.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.gch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/solution/basis/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/midi.cpp.o"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -o CMakeFiles/music_midi_alsa.dir/midi.cpp.o -c /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/midi.cpp

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/midi.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/music_midi_alsa.dir/midi.cpp.i"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -E /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/midi.cpp > CMakeFiles/music_midi_alsa.dir/midi.cpp.i

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/midi.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/music_midi_alsa.dir/midi.cpp.s"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -S /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/midi.cpp -o CMakeFiles/music_midi_alsa.dir/midi.cpp.s

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/out.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/flags.make
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/out.cpp.o: operating-system/operating-system-linux/music_midi_alsa/out.cpp
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/out.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/out.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.gch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/solution/basis/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/out.cpp.o"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -o CMakeFiles/music_midi_alsa.dir/out.cpp.o -c /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/out.cpp

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/out.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/music_midi_alsa.dir/out.cpp.i"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -E /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/out.cpp > CMakeFiles/music_midi_alsa.dir/out.cpp.i

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/out.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/music_midi_alsa.dir/out.cpp.s"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -S /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/out.cpp -o CMakeFiles/music_midi_alsa.dir/out.cpp.s

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/translation.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/flags.make
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/translation.cpp.o: operating-system/operating-system-linux/music_midi_alsa/translation.cpp
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/translation.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/translation.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.gch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/solution/basis/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/translation.cpp.o"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -o CMakeFiles/music_midi_alsa.dir/translation.cpp.o -c /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/translation.cpp

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/translation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/music_midi_alsa.dir/translation.cpp.i"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -E /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/translation.cpp > CMakeFiles/music_midi_alsa.dir/translation.cpp.i

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/translation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/music_midi_alsa.dir/translation.cpp.s"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -S /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/translation.cpp -o CMakeFiles/music_midi_alsa.dir/translation.cpp.s

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/framework.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/flags.make
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/framework.cpp.o: operating-system/operating-system-linux/music_midi_alsa/framework.cpp
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/framework.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/framework.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.gch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/solution/basis/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/framework.cpp.o"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -o CMakeFiles/music_midi_alsa.dir/framework.cpp.o -c /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/framework.cpp

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/framework.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/music_midi_alsa.dir/framework.cpp.i"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -E /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/framework.cpp > CMakeFiles/music_midi_alsa.dir/framework.cpp.i

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/framework.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/music_midi_alsa.dir/framework.cpp.s"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -S /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/framework.cpp -o CMakeFiles/music_midi_alsa.dir/framework.cpp.s

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/message_out.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/flags.make
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/message_out.cpp.o: operating-system/operating-system-linux/music_midi_alsa/message_out.cpp
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/message_out.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/message_out.cpp.o: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.gch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/solution/basis/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/message_out.cpp.o"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -o CMakeFiles/music_midi_alsa.dir/message_out.cpp.o -c /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/message_out.cpp

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/message_out.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/music_midi_alsa.dir/message_out.cpp.i"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -E /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/message_out.cpp > CMakeFiles/music_midi_alsa.dir/message_out.cpp.i

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/message_out.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/music_midi_alsa.dir/message_out.cpp.s"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx -S /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/message_out.cpp -o CMakeFiles/music_midi_alsa.dir/message_out.cpp.s

# Object files for target music_midi_alsa
music_midi_alsa_OBJECTS = \
"CMakeFiles/music_midi_alsa.dir/_.cpp.o" \
"CMakeFiles/music_midi_alsa.dir/_factory.cpp.o" \
"CMakeFiles/music_midi_alsa.dir/midi.cpp.o" \
"CMakeFiles/music_midi_alsa.dir/out.cpp.o" \
"CMakeFiles/music_midi_alsa.dir/translation.cpp.o" \
"CMakeFiles/music_midi_alsa.dir/framework.cpp.o" \
"CMakeFiles/music_midi_alsa.dir/message_out.cpp.o"

# External object files for target music_midi_alsa
music_midi_alsa_EXTERNAL_OBJECTS =

output/libmusic_midi_alsa.so: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/cmake_pch.hxx.gch
output/libmusic_midi_alsa.so: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/_.cpp.o
output/libmusic_midi_alsa.so: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/_factory.cpp.o
output/libmusic_midi_alsa.so: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/midi.cpp.o
output/libmusic_midi_alsa.so: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/out.cpp.o
output/libmusic_midi_alsa.so: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/translation.cpp.o
output/libmusic_midi_alsa.so: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/framework.cpp.o
output/libmusic_midi_alsa.so: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/message_out.cpp.o
output/libmusic_midi_alsa.so: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/build.make
output/libmusic_midi_alsa.so: output/libveriwell_multimedia.so
output/libmusic_midi_alsa.so: output/libaura.so
output/libmusic_midi_alsa.so: output/libaqua.so
output/libmusic_midi_alsa.so: output/libapex.so
output/libmusic_midi_alsa.so: output/libacme.so
output/libmusic_midi_alsa.so: operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/solution/basis/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX shared library ../../../output/libmusic_midi_alsa.so"
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/music_midi_alsa.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/build: output/libmusic_midi_alsa.so

.PHONY : operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/build

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/clean:
	cd /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa && $(CMAKE_COMMAND) -P CMakeFiles/music_midi_alsa.dir/cmake_clean.cmake
.PHONY : operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/clean

operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/depend:
	cd /home/pi/solution/basis && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/solution/basis /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa /home/pi/solution/basis /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa /home/pi/solution/basis/operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : operating-system/operating-system-linux/music_midi_alsa/CMakeFiles/music_midi_alsa.dir/depend

