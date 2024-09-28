#include "audiocontroller.h"

audioController::audioController(QObject *parent)
    : QObject(parent)
    , m_volumeLevel(50)
{

}

int audioController::volumeLevel() const
{
    return m_volumeLevel;
}

void audioController::increaseVolume(const int &val)
{
    int newVolumeLevel {m_volumeLevel + val};
    if ( 0 >= newVolumeLevel )
    {
        newVolumeLevel = 0;
    }
    if ( 100 <= newVolumeLevel )
    {
        newVolumeLevel = 100;
    }
    setVolumeLevel(newVolumeLevel);
    qDebug() << "Volume increased" << newVolumeLevel;

}



void audioController::setVolumeLevel(int newVolumeLevel)
{
    if (m_volumeLevel == newVolumeLevel)
        return;
    m_volumeLevel = newVolumeLevel;
    emit volumeLevelChanged();
}
