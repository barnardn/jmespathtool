if [ "${CONFIGURATION}" = "Debug" ] ; then
    ${SRCROOT}/buildtools/swiftformat --lint $SRCROOT
    ${SRCROOT}/buildtools/swiftlint lint --config .swiftlint.yml
fi
