#include "spion.h"
#include "ui_spion.h"

spion::spion(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::spion)
{
    ui->setupUi(this);

    my_port= new QSerialPort(this);

    ui->actionGrip->setEnabled(false);
    ui->actionUngrip->setEnabled(false);
    ui->actionTake->setEnabled(false);
    ui->actionUnTake->setEnabled(false);
}

spion::~spion()
{
    delete ui;
}

void spion::on_actionAboutQt_triggered()
{
    QApplication::aboutQt();
}

void spion::on_actionQuit_triggered()
{
    if(my_port->isOpen()){
        my_port->close();
    }

    QApplication::quit();
}

void spion::on_btnOpen_clicked()
{
    QString dev_name="/dev/";
    dev_name += ui->cmbPort->currentText();

    if(ui->btnOpen->text()=="Open"){

        my_port->setPortName(dev_name);

        if(my_port->open(QIODevice::ReadWrite)){
            my_port->setBaudRate(QSerialPort::Baud38400,QSerialPort::AllDirections);
            my_port->setDataBits(QSerialPort::Data8);
            my_port->setStopBits(QSerialPort::OneStop);
            my_port->setFlowControl(QSerialPort::NoFlowControl);
            my_port->setParity(QSerialPort::NoParity);
            QMessageBox::information(this,"success","port success on "+dev_name );
            ui->btnOpen->setText("Close");

            ui->actionGrip->setEnabled(true);
            ui->actionUngrip->setEnabled(true);
            ui->actionTake->setEnabled(true);
            ui->actionUnTake->setEnabled(true);

        }
        else{
            QMessageBox::critical(this,"Failed","port failed on "+dev_name);
            ui->btnOpen->setText("Open");
        }
    }

    else{
        if(my_port->isOpen()){
            my_port->close();
        }

        ui->actionGrip->setEnabled(false);
        ui->actionUngrip->setEnabled(false);
        ui->actionTake->setEnabled(false);
        ui->actionUnTake->setEnabled(false);

        ui->btnOpen->setText("Open");
    }
}

void spion::on_actionGrip_triggered()
{
    QByteArray comdata="grip\n";
    my_port->write(comdata);
}

void spion::on_actionUngrip_triggered()
{
    QByteArray comdata="ungrip\n";
    my_port->write(comdata);
}

void spion::on_actionUnTake_triggered()
{
    QByteArray comdata="untake\n";
    my_port->write(comdata);
}

void spion::on_actionTake_triggered()
{
    QByteArray comdata="take\n";
    my_port->write(comdata);
}
