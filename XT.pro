QT  +=core gui
QT  +=core gui declarative

greaterThan(QT_MAJOR_VERSION,4):QT +=widgets

TARGET=XT
TEMPLATE =app

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += \
    main.cpp \
    fpga.cpp

HEADERS += \
    hps_0.h \
    fpga.h

FORMS   +=
INCLUDEPATH +=/mnt/hgfs/shared/my20140727/XT/hwlib/include
DEPENDPATH +=/mnt/hgfs/shared/my20140727/XT/hwlib/include

OTHER_FILES += \
    qml/p0_kjh.qml \
    qml/p0_kjh_cs.qml \
    qml/p1_zj.qml \
    qml/p2_abdj.qml \
    qml/p3_mnp.qml \
    qml/p4_mnz.qml \
    qml/p5_tx.qml \
    qml/p3_mnp_tk.qml \
    qml/p4_mnz_tk.qml \
    qml/p6_zljs.qml \
    qml/1.qml

RESOURCES += \
    source.qrc
QMAKE_CXXFLAGS += -std=c++0x
