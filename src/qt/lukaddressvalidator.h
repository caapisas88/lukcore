// Copyright (c) 2011-2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef LUK_QT_LUKADDRESSVALIDATOR_H
#define LUK_QT_LUKADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class LukAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit LukAddressEntryValidator(QObject* parent);

    State validate(QString& input, int& pos) const;
};

/** Luk address widget validator, checks for a valid luk address.
 */
class LukAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit LukAddressCheckValidator(QObject* parent);

    State validate(QString& input, int& pos) const;
};

#endif // LUK_QT_LUKADDRESSVALIDATOR_H
