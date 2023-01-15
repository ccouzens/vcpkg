vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO DanBloomberg/leptonica
    REF 97b82b09ea2caeb203df4abeb1877eda661e6bfe # 1.83.0
    SHA512 7ada83d02a3d294b55f00f01e6ffa5fdc2eeab9c30becbfd52e5d682971352f531137af94296c5d3135ef3102876c3c70d84ed146f7f310b859b6cf6d2c974f0
    HEAD_REF master
    PATCHES
        fix-CMakeDependency.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DSW_BUILD=OFF
        -DCMAKE_REQUIRE_FIND_PACKAGE_GIF=TRUE
        -DCMAKE_REQUIRE_FIND_PACKAGE_JPEG=TRUE
        -DCMAKE_REQUIRE_FIND_PACKAGE_PNG=TRUE
        -DCMAKE_REQUIRE_FIND_PACKAGE_TIFF=TRUE
        -DCMAKE_REQUIRE_FIND_PACKAGE_ZLIB=TRUE
)

vcpkg_cmake_install()

vcpkg_fixup_pkgconfig()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/leptonica)

vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/leptonica-license.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
