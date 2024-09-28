#ifndef SPEEDCONTROLLER_H
#define SPEEDCONTROLLER_H

#include <QObject>

class speedController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(uint carSpeed READ carSpeed WRITE setCarSpeed NOTIFY carSpeedChanged FINAL)
public:
    explicit speedController(QObject *parent = nullptr);

    uint carSpeed() const;
    Q_INVOKABLE void increaseCarSpeed(const int &value);
public slots:
    void setCarSpeed(uint newCarSpeed);

signals:
    void carSpeedChanged();
private:
    uint m_carSpeed;
};

#endif // SPEEDCONTROLLER_H
