



#message(STATUS "CMAKE_SYSTEM_NAME is ${CMAKE_SYSTEM_NAME}")

#FIND_PACKAGE(PkgConfig)

#include(FindPkgConfig)

#IF(PKG_CONFIG_FOUND)
# use pkg_check_modules()
#ENDIF(PKG_CONFIG_FOUND)
set(USE_PKGCONFIG TRUE)
set(CURL_NANO_HTTP TRUE)
set(HAS_WAYLAND TRUE)
set(LAUNCH_STORE_SYSTEM "linux")


if ("${CMAKE_BUILD_TYPE}" STREQUAL "")

   set(CMAKE_BUILD_TYPE Debug)

endif ()


if (NOT ${CMAKE_SYSTEM_NAME} STREQUAL "Linux")

   error("This file is designed to be used only for linux systems...")

endif ()


#if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
#
#   message(STATUS "GNU Compiler")
#
#   string(APPEND CMAKE_CXX_FLAGS "-fPIC -fexceptions -fnon-call-exceptions -frtti")
#
#   #set(EXTRA_CXX_TARGET_COMPILER_OPTIONS "-ansi")
#
#else()
#
#   #set(EXTRA_CXX_TARGET_COMPILER_OPTIONS "")
#
#endif ()


set(DONT_USE_PKG_CONFIG NOT PKG_CONFIG_FOUND)


if ($ENV{XDG_CURRENT_DESKTOP} STREQUAL "KDE")
   set(KDE_DESKTOP TRUE)
   message(STATUS "System is KDE")
   set(DESKTOP_ENVIRONMENT_NAME "kde")
elseif ($ENV{XDG_CURRENT_DESKTOP} STREQUAL "ubuntu:GNOME")
   set(GNOME_DESKTOP TRUE)
   message(STATUS "System is GNOME")
   set(DESKTOP_ENVIRONMENT_NAME "gnome")
elseif ($ENV{XDG_CURRENT_DESKTOP} STREQUAL "GNOME")
   set(GNOME_DESKTOP TRUE)
   message(STATUS "System is GNOME")
   set(DESKTOP_ENVIRONMENT_NAME "gnome")
elseif ($ENV{XDG_CURRENT_DESKTOP} STREQUAL "LXDE")
   set(LXDE_DESKTOP TRUE)
   message(STATUS "System is LXDE")
   set(DESKTOP_ENVIRONMENT_NAME "lxde")
endif ()

message(STATUS "DESKTOP_ENVIRONMENT_NAME is ${DESKTOP_ENVIRONMENT_NAME}")

set(UNDERSCORE_OPERATING_SYSTEM $ENV{__SYSTEM_UNDERSCORE_OPERATING_SYSTEM})
set(SLASHED_OPERATING_SYSTEM $ENV{__SYSTEM_SLASHED_OPERATING_SYSTEM})
set(DISTRO $ENV{__SYSTEM_DISTRO})
set(DISTRO_RELEASE $ENV{__SYSTEM_DISTRO_RELEASE})

if(${GNOME_DESKTOP})
   execute_process(COMMAND gnome-shell --version OUTPUT_VARIABLE GNOME_SHELL_VERSION_RAW OUTPUT_STRIP_TRAILING_WHITESPACE)
   message(STATUS "GNOME_SHELL_VERSION_RAW is ${GNOME_SHELL_VERSION_RAW}")
   string(TOLOWER ${GNOME_SHELL_VERSION_RAW} GNOME_RELEASE)
   #message(STATUS "GNOME_RELEASE now is ${GNOME_RELEASE}")
   string(REPLACE "gnome" "" GNOME_RELEASE ${GNOME_RELEASE})
   string(REPLACE "shell" "" GNOME_RELEASE ${GNOME_RELEASE})
   string(STRIP ${GNOME_RELEASE} GNOME_RELEASE)
   message(STATUS "GNOME_RELEASE is ${GNOME_RELEASE}")
   string(FIND ${GNOME_RELEASE} "." GNOME_RELEASE_FIRST_DOT)
   string(SUBSTRING ${GNOME_RELEASE} 0 ${GNOME_RELEASE_FIRST_DOT} GNOME_RELEASE_MAJOR)
   message(STATUS "GNOME_RELEASE_MAJOR is ${GNOME_RELEASE_MAJOR}")
   if(${GNOME_RELEASE_MAJOR} GREATER_EQUAL 40)
      #set(HAS_GTK4 TRUE)
      #message(STATUS "HAS_GTK4 is ${HAS_GTK4}")
      #add_compile_definitions(HAS_GTK4)
      set(GNOME_RELEASE_MAJOR "3")
   endif()
   if(${GNOME_RELEASE_MAJOR} GREATER_EQUAL 3)
      set(HAS_GTK3 TRUE)
      message(STATUS "HAS_GTK3 is ${HAS_GTK3}")
      add_compile_definitions(HAS_GTK3)
   endif()
endif()


string(TOLOWER ${CMAKE_BUILD_TYPE} tolower_cmake_build_type)


message(STATUS "tolower_cmake_build_type = ${tolower_cmake_build_type}")


if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
   set(CMAKE_CXX_EXTENSIONS OFF)
endif()


if (${tolower_cmake_build_type} STREQUAL "debug")

   message(STATUS "Debug Build!!")

   add_compile_definitions(DEBUG)

   message(STATUS "DEBUG compile definition set!!")

elseif (${tolower_cmake_build_type} STREQUAL "relwithdebinfo")

   message(STATUS "RelWithDebInfo Build!!")

   add_compile_definitions(DEBUG)

   message(STATUS "DEBUG compile definition set!!")

elseif (${tolower_cmake_build_type} STREQUAL "release")

   message(STATUS "Release Build!!")

   add_compile_definitions(NDEBUG)

   message(STATUS "NDEBUG compile definition set!!")

elseif (${tolower_cmake_build_type} STREQUAL "minsizerel")

   message(STATUS "MinSizeRel Build!!")

   add_compile_definitions(NDEBUG)

   message(STATUS "NDEBUG compile definition set!!")

else ()

   message(STATUS "\"${CMAKE_BUILD_TYPE}\" Build!!")

   add_compile_definitions(DEBUG)

   message(STATUS "DEBUG compile definition set!!")

endif ()


SET(CMAKE_SKIP_BUILD_RPATH FALSE)
SET(CMAKE_BUILD_WITH_INSTALL_RPATH TRUE)
set(CMAKE_INSTALL_RPATH $ORIGIN)
#set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

set(LINUX TRUE)
set(FREEBSD FALSE)
set(OPERATING_SYSTEM_NAME "linux")
set(OPERATING_SYSTEM_POSIX TRUE)
set(FILE_SYSTEM_INOTIFY TRUE)
set(POSIX_SPAWN TRUE)
set(WITH_X11 TRUE)
set(WITH_XCB TRUE)
set(USE_OPENSSL TRUE)
set(PTHREAD TRUE)
set(PLATFORM_NAME "linux")

message(STATUS "DISTRO is ${DISTRO}")

if (${DISTRO} STREQUAL "ubuntu")

   set(UBUNTU TRUE)

   set(DEBIAN_LIKE TRUE)

   message(STATUS "UBUNTU has been set TRUE")

   set(APPINDICATOR_PKG_MODULE "ayatana-appindicator3-0.1")

   set(MPG123_PKG_MODULE "libmpg123")

   set(HAS_SYSTEM_UNAC TRUE)

elseif (${DISTRO} STREQUAL "debian")

   set(DEBIAN TRUE)

   add_compile_definitions(DEBIAN_LINUX)

   message(STATUS "DEBIAN has been set TRUE")

   set(APPINDICATOR_PKG_MODULE "ayatana-appindicator3-0.1")

   set(MPG123_PKG_MODULE "libmpg123")

   add_compile_options(-gdwarf-4)

   set(HAS_SYSTEM_UNAC TRUE)

elseif (${DISTRO} STREQUAL "opensuse-leap" OR ${DISTRO} STREQUAL "opensuse-tumbleweed")

   set(SUSE TRUE)

   add_compile_definitions(SUSE_LINUX)

   message(STATUS "SUSE has been set TRUE")

   set(APPINDICATOR_PKG_MODULE "appindicator3-0.1")

   set(MPG123_PKG_MODULE "libmpg123")

elseif (${DISTRO} STREQUAL "fedora")

   set(FEDORA TRUE)

   add_compile_definitions(FEDORA_LINUX)

   set(APPINDICATOR_PKG_MODULE "appindicator3-0.1")

   message(STATUS "FEDORA has been set TRUE")

elseif ("${DISTRO}" STREQUAL "raspbian")

   set(RASPBIAN TRUE)

   set(DEBIAN_LIKE TRUE)

   set(DONT_USE_PKG_CONFIG FALSE)

   add_compile_definitions(RASPBERRYPIOS)

   set(HAS_SYSTEM_UNAC TRUE)

   set(HAS_WAYLAND FALSE)

   message(STATUS "RASPBERRYPIOS defined!!")

elseif (${DISTRO} STREQUAL "manjaro")

      set(MANJARO TRUE)

      set(ARCH_LIKE TRUE)

      message(STATUS "MANJARO has been set TRUE")

      set(APPINDICATOR_PKG_MODULE "ayatana-appindicator3-0.1")

      set(MPG123_PKG_MODULE "libmpg123")

      set(HAS_SYSTEM_UNAC FALSE)

else ()

   set(APPINDICATOR_PKG_MODULE "appindicator3-0.1")

   set(MPG123_PKG_MODULE "mpg123")

endif ()


message(STATUS "DISTRO_RELEASE is ${DISTRO_RELEASE}")


set(ALSA_MIDI TRUE)
set(INTERPROCESS_COMMUNICATION_SYSTEM_5 TRUE)


add_compile_definitions(WITH_X11)
link_libraries(pthread)
include(FindPkgConfig)


if (EXISTS $ENV{HOME}/__config/xfce.txt)

   set(LINUX_XFCE TRUE)
   message(STATUS "Adding Xfce/X11 dependency.")

endif ()


if (KDE_DESKTOP)

   set(WITH_XCB TRUE)
   add_compile_definitions(WITH_XCB=1)

   set(QT_MIN_VERSION "5.3.0")
   set(KF5_MIN_VERSION "5.2.0")

   # apt install extra-cmake-modules
   # dnf install extra-cmake-modules
   find_package(ECM 1.0.0 REQUIRED NO_MODULE)
   set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

   # apt install libkf5notifications-dev
   # dnf install kf5-knotifications-devel

   #include(KDEInstallDirs)
   #include(KDECMakeSettings)
   #include(KDECompilerSettings NO_POLICY_SCOPE)
   #    find_package(KF5 ${KF5_MIN_VERSION} REQUIRED COMPONENTS
   # CoreAddons      # KAboutData
   #          I18n            # KLocalizedString
   #         WidgetsAddons   # KMessageBox
   #      Notifications
   #     )
   #include(FeatureSummary)

   # Find Qt modules
   #find_package(Qt5 ${QT_MIN_VERSION} CONFIG REQUIRED COMPONENTS
   #  Core    # QCommandLineParser, QStringLiteral
   #  Widgets # QApplication
   #  )
   find_package(KF5 ${KF5_MIN_VERSION} REQUIRED COMPONENTS
      # CoreAddons      # KAboutData
      #          I18n            # KLocalizedString
      #         WidgetsAddons   # KMessageBox
      CoreAddons
      Notifications
      ConfigWidgets
      KIO
      IconThemes
      Plasma
      PlasmaQuick
   )

   find_package(LibKWorkspace CONFIG REQUIRED)

   find_package(Qt5 ${QT_MIN_VERSION} REQUIRED COMPONENTS
      Core
      DBus
      UiTools
      X11Extras
      Gui
   )

   find_package(Qt5Gui ${QT_MIN_VERSION} CONFIG REQUIRED Private)

   # Find KDE modules

   #feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)
   #        find_package(KDE5 REQUIRED)
   message(STATUS "Adding KDE/xcb dependency.")
   #        file (STRINGS $ENV{HOME}/__config/knotifications/cflags.txt knotifications_cflags)
   #        file (STRINGS $ENV{HOME}/__config/knotifications/libs.txt knotifications_libs)
   #        if(knotifications_cflags STREQUAL "")
   #            set(knotifications_cflags -I/usr/include/KF5/KNotifications)
   #        endif()
   #        if(knotifications_libs STREQUAL "")
   #            set(knotifications_cflags -I/usr/include/KF5/KNotifications)
   #        endif()
endif ()

set(default_draw2d "draw2d_cairo")
set(default_imaging "imaging_freeimage")
set(default_write_text "write_text_pango")
set(default_audio "audio_alsa")
set(default_input "input_libinput")
set(default_music_midi "music_midi_alsa")
set(default_node "node_linux")
set(default_audio_mixer "audio_mixer_alsa")
set(default_gpu "gpu_opengl")
set(default_networking "networking_bsd")
#add_compile_definitions(default_draw2d=draw2d_cairo)
#add_compile_definitions(default_imaging=imaging_freeimage)
#add_compile_definitions(default_write_text=write_text_pango)
#add_compile_definitions(default_audio=audio_alsa)
#add_compile_definitions(default_music_midi=music_midi_alsa)
#add_compile_definitions(default_node=node_linux)


set(LINUX TRUE)


if (LXDE_DESKTOP)

   list(APPEND app_common_dependencies desktop_environment_gnome)

   #    list(APPEND static_app_common_dependencies
   #            static_desktop_environment_gnome
   #            static_node_gnome
   #            static_node_gtk
   #            static_windowing_x11)

   set(default_windowing "windowing_x11")

   set(default_desktop_environment desktop_environment_gnome)

   add_compile_definitions(DESKTOP_ENVIRONMENT_GNOME)

   add_compile_definitions(default_windowing=windowing_x11)

endif ()


if (XFCE_DESKTOP)

   list(APPEND app_common_dependencies desktop_environment_xfce)

   list(APPEND static_app_common_dependencies static_desktop_environment_xfce)

   set(default_windowing "windowing_x11")

   set(default_desktop_environment desktop_environment_xfce)

   add_compile_definitions(DESKTOP_ENVIRONMENT_XFCE)

   add_compile_definitions(default_windowing=windowing_x11)

endif ()


if (GNOME_DESKTOP)

   message(STATUS "Adding GNOME/X11 dependency.")

   list(APPEND app_common_dependencies desktop_environment_gnome)

   list(APPEND static_app_common_dependencies
      static_desktop_environment_gnome
      static_node_gnome
      static_node_gtk
      static_node_linux
      static_windowing_x11)

   set(default_windowing "windowing_x11")

   set(default_desktop_environment desktop_environment_gnome)

   add_compile_definitions(DESKTOP_ENVIRONMENT_GNOME)

endif ()


if (KDE_DESKTOP)

   list(APPEND app_common_dependencies desktop_environment_kde)

   #    list(APPEND static_app_common_dependencies
   #            static_desktop_environment_kde
   #            static_node_kde
   #            static_windowing_xcb
   #            KF5::Notifications
   #            KF5::ConfigWidgets
   #            KF5::IconThemes
   #            KF5::KIOCore
   #            KF5::KIOFileWidgets
   #            KF5::KIOWidgets
   #            KF5::KIONTLM
   #            PW::KWorkspace
   #            )

   set(default_windowing "windowing_xcb")

   set(default_desktop_environment desktop_environment_kde)

   add_compile_definitions(DESKTOP_ENVIRONMENT_KDE)

   add_compile_definitions(default_windowing=windowing_xcb)

endif ()


#set(static_acme_extra_pkgconfig cairo xcb x11 xkbcommon xcb-render xcb-aux x11-xcb)
#set(static_aura_posix_pkgconfig libstartup-notification-1.0)
#
#set(static_acme_pkgconfig freetype2 libidn ${static_acme_extra_pkgconfig} ncurses dbus-glib-1)
#set(static_apex_pkgconfig libcrypto libssl libarchive)
#set(static_database_cairo_pkgconfig freetype2 pango cairo pangocairo)
#set(static_database_sqlite3_pkgconfig sqlite3)
#set(static_mpg123_pkgconfig ${MPG123_PKG_MODULE})
#set(static_desktop_environment_gnome_pkgconfig glib-2.0 gtk+-3.0 gdk-3.0 ${APPINDICATOR_PKG_MODULE})
#set(static_desktop_environment_kde_pkgconfig Qt5X11Extras Qt5Core Qt5UiTools)

#if (KDE_DESKTOP)
#    set(static_desktop_environment_pkgconfig ${static_desktop_environment_kde_pkgconfig})
#elseif (GNOME_DESKTOP)
#    set(static_desktop_environment_pkgconfig ${static_desktop_environment_gnome_pkgconfig})
#else ()
#    set(static_desktop_environment_pkgconfig ${static_desktop_environment_gnome_pkgconfig})
#endif()
#


set(LIBCXX_TARGETING_MSVC OFF)


add_compile_definitions(UNICODE)
add_compile_definitions(_UNICODE)

list(APPEND app_common_dependencies ${default_node})

#list(APPEND app_common_dependencies _console_application_build_helper)


#set(LIBRARY_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/time-${OPERATING_SYSTEM_NAME}/x64/basis)
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/output)
#set(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/time-${OPERATING_SYSTEM_NAME}/x64/basis)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/output)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/library)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output)


link_directories(${LIBRARY_OUTPUT_PATH})
link_directories(${CMAKE_CURRENT_SOURCE_DIR}/operating_system/storage-${OPERATING_SYSTEM_NAME}/library/x64/basis)
link_directories(${CMAKE_CURRENT_SOURCE_DIR}/operating_system/storage-${OPERATING_SYSTEM_NAME}/third/library/x64/basis)


include_directories(${WORKSPACE_FOLDER})
include_directories($ENV{HOME}/__config)
include_directories(${WORKSPACE_FOLDER}/source)
include_directories(${WORKSPACE_FOLDER}/source/app)
include_directories(${WORKSPACE_FOLDER}/source/app/include)
include_directories(${WORKSPACE_FOLDER}/source/include)
include_directories(${WORKSPACE_FOLDER}/port/_)
if (NOT ${HAS_SYSTEM_UNAC})
   include_directories(${WORKSPACE_FOLDER}/port/base/unac/include)
endif ()
include_directories(${WORKSPACE_FOLDER}/port/include)
include_directories(${WORKSPACE_FOLDER}/operating_system)
if (OPERATING_SYSTEM_POSIX)
   include_directories(${WORKSPACE_FOLDER}/operating_system/operating_system-posix)
   include_directories(${WORKSPACE_FOLDER}/operating_system/operating_system-posix/include)
endif ()
include_directories(${WORKSPACE_FOLDER}/operating_system/operating_system-${OPERATING_SYSTEM_NAME})
include_directories(${WORKSPACE_FOLDER}/operating_system/operating_system-${OPERATING_SYSTEM_NAME}/include)
include_directories(${WORKSPACE_FOLDER}/operating_system/operating_system-${OPERATING_SYSTEM_NAME}/include/configuration_selection/${CMAKE_BUILD_TYPE})
include_directories(${WORKSPACE_FOLDER}/operating_system/operating_system-${OPERATING_SYSTEM_NAME}/operating_system/${SLASHED_OPERATING_SYSTEM})
include_directories(${WORKSPACE_FOLDER}/operating_system/operating_system-${OPERATING_SYSTEM_NAME}/operating_system/${DISTRO})

set(INCLUDE_DRAW2D_CAIRO TRUE)
set(INCLUDE_IMAGING_FREEIMAGE TRUE)


set(STORE_FOLDER $ENV{HOME}/store/${SLASHED_OPERATING_SYSTEM})




