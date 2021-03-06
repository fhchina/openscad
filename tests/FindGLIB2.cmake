find_package(PkgConfig REQUIRED)

pkg_search_module(GLIB2 REQUIRED glib-2.0)
#message("GLIB2_LIBRARIES ${GLIB2_LIBRARIES}")
message("GLIB2_LIBRARY_DIRS ${GLIB2_LIBRARY_DIRS}")
#message("GLIB2_LDFLAGS ${GLIB2_LDFLAGS}")
#message("GLIB2_LDFLAGS_OTHER ${GLIB2_LDFLAGS_OTHER}")
message("GLIB2_INCLUDE_DIRS ${GLIB2_INCLUDE_DIRS}")
#message("GLIB2_CFLAGS ${GLIB2_CFLAGS}")
#message("GLIB2_CFLAGS_OTHER ${GLIB2_CFLAGS_OTHER}")
message("GLIB2_LIBDIR ${GLIB2_LIBDIR}")

set(GLIB2_DEFINITIONS ${GLIB2_CFLAGS_OTHER})
#message("GLIB2_DEFINITIONS ${GLIB2_DEFINITIONS}")

set(GLIB2_LIBRARY_NAMES ${GLIB2_LIBRARIES})
set(GLIB2_LIBRARIES "")
foreach(GLIB2_LIB ${GLIB2_LIBRARY_NAMES})
#  message("lib: ${GLIB2_LIB}")
  set(TMP TMP-NOTFOUND)
  find_library(TMP NAMES ${GLIB2_LIB}
               PATHS ${GLIB2_LIBRARY_DIRS}
               PATHS ${GLIB2_LIBDIR}
               NO_DEFAULT_PATH)
#  message("TMP: ${TMP}")
  list(APPEND GLIB2_LIBRARIES "${TMP}")
endforeach()
message("GLIB2_LIBRARIES: ${GLIB2_LIBRARIES}")
