// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import untitled3

Window {
    width: mainScreen.width
    height: mainScreen.height

    visible: true
    visibility: Window.FullScreen // This sets the window to full-screen on startup
    title: "untitled3"

    Screen01 {
        id: mainScreen
    }

}

