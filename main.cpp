// Copyright (c) 2025 kong9812
#include <QtWidgets/qapplication.h>
#include <QtWidgets/qmainwindow.h>

int main(int argc, char* argv[])
{
	QApplication app(argc, argv);
	QMainWindow mainWindow;
	mainWindow.setWindowTitle("Hello World");
	mainWindow.resize(800, 600);
	mainWindow.show();
	return app.exec();
}