#ifndef SPION_H
#define SPION_H

#include <QMainWindow>
#include <QMessageBox>
#include <QSerialPort>

namespace Ui {
class spion;
}

class spion : public QMainWindow
{
    Q_OBJECT

public:
    explicit spion(QWidget *parent = 0);
    ~spion();

private slots:
    void on_actionAboutQt_triggered();

    void on_actionQuit_triggered();

    void on_btnOpen_clicked();

    void on_actionGrip_triggered();

    void on_actionUngrip_triggered();

    void on_actionUnTake_triggered();

    void on_actionTake_triggered();

private:
    Ui::spion *ui;
    QSerialPort* my_port;
};

#endif // SPION_H
