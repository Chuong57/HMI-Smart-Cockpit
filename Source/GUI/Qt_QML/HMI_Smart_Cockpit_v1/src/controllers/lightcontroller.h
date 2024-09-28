#ifndef LIGHTCONTROLLER_H
#define LIGHTCONTROLLER_H

#include <QObject>

class lightController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool lightControl READ lightControl WRITE setLightControl NOTIFY lightControlChanged FINAL)
public:
    explicit lightController(QObject *parent = nullptr);
    bool lightControl() const;
public slots:
    void setLightControl(bool newLightControl);
signals:
    void lightControlChanged();
private:
    bool m_lightControl;
};

#endif // LIGHTCONTROLLER_H
