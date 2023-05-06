# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = Lab5

CONFIG += sailfishapp

SOURCES += src/Lab5.cpp

DISTFILES += qml/Lab5.qml \
    qml/cover/CoverPage.qml \
    qml/pages/Page1.qml \
    qml/pages/Page10.qml \
    qml/pages/Page2_1.qml \
    qml/pages/Page2_2.qml \
    qml/pages/Page3_1.qml \
    qml/pages/Page3_2.qml \
    qml/pages/Page4_1.qml \
    qml/pages/Page4_2.qml \
    qml/pages/Page5_1.qml \
    qml/pages/Page5_2.qml \
    qml/pages/Page6.qml \
    qml/pages/Page7.qml \
    qml/pages/Page8.qml \
    qml/pages/Page9.qml \
    qml/pages/StartPage.qml \
    rpm/Lab5.changes.in \
    rpm/Lab5.changes.run.in \
    rpm/Lab5.spec \
    rpm/Lab5.yaml \
    translations/*.ts \
    Lab5.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/Lab5-de.ts
