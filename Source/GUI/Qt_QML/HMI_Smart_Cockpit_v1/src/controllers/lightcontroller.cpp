#include "lightcontroller.h"

lightController::lightController(QObject *parent)
    : QObject(parent)
    , m_lightControl(false)
{

}

bool lightController::lightControl() const
{
    return m_lightControl;
}

void lightController::setLightControl(bool newLightControl)
{
    if (m_lightControl == newLightControl)
        return;
    m_lightControl = newLightControl;
    emit lightControlChanged();
}
