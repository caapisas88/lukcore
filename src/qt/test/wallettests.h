#ifndef LUK_QT_TEST_WALLETTESTS_H
#define LUK_QT_TEST_WALLETTESTS_H

#include <QObject>
#include <QTest>

class WalletTests : public QObject
{
    Q_OBJECT

private Q_SLOTS:
    void walletTests();
};

#endif // LUK_QT_TEST_WALLETTESTS_H
