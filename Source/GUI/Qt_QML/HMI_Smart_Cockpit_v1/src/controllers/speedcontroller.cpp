#include "speedcontroller.h"
#include <QDebug>

speedController::speedController(QObject *parent)
    : QObject{parent}
    , m_carSpeed{0}
{}

uint speedController::carSpeed() const
{
    return m_carSpeed;
}

void speedController::increaseCarSpeed(const int &value)
{
    int newSpeedValue {static_cast<int>(m_carSpeed) + value};
    if ( 0 >= newSpeedValue )
    {
        newSpeedValue = 0;
    }
    if ( 99 <= newSpeedValue )
    {
        newSpeedValue = 99;
    }
    setCarSpeed(newSpeedValue);
    qDebug() << "Speed increased" << newSpeedValue;

}

void speedController::setCarSpeed(uint newCarSpeed)
{
    if (m_carSpeed == newCarSpeed)
        return;
    m_carSpeed = newCarSpeed;
    emit carSpeedChanged();
}
