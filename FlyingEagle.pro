# Add more folders to ship with the application, here
folder_01.source = qml/FlyingEagle
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
# CONFIG += mobility
# MOBILITY +=

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qml/FlyingEagle/StarSelectionPage.qml \
    qml/FlyingEagle/LangSelectionPage.qml \
    qml/FlyingEagle/FavoritePage.qml \
    qml/FlyingEagle/TopicSelectionPage.qml \
    qml/FlyingEagle/RankSelectionPage.qml \
    qml/FlyingEagle/NewMusicSelectionPage.qml \
    qml/FlyingEagle/MainBar.qml \
    qml/FlyingEagle/componentCreation.js \
    qml/FlyingEagle/TabBarButton.qml \
    qml/FlyingEagle/TestListModel.qml \
    qml/FlyingEagle/FlipButton.qml \
    qml/FlyingEagle/FlipEdgeButton.qml \
    qml/FlyingEagle/FinalMusicSelectionPage.qml \
    qml/FlyingEagle/TunningPage.qml \
    qml/FlyingEagle/FinalRankMusicSelectionPage.qml \
    qml/FlyingEagle/SearchBarMenu.qml \
    qml/FlyingEagle/BaotaiGexingJianJiePage.qml \
    qml/FlyingEagle/KeyBoard/ZishuInput.qml \
    qml/FlyingEagle/MovieUDiskPage.qml \
    qml/FlyingEagle/FoldMenuList.qml
