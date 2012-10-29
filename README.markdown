ParsiDigits
===========

Some simple utilities to help working with parsi unicode digits.

Convertion between parsi and western digits:

    require 'parsi-digits'
    ‪"15,000 تومان".with_parsi_digits
      => ‫"۱۵,۰۰۰ تومان"
    123.25.with_parsi_digits
      => "۱۲۳/۲۵"
    "۱۲۳۴۵".with_western_digits
      => "12345"

Easy convertion of parsi digits to Float or Integer (which is useful especially for input forms):

    "۱۲۳۴۵".to_i
      => 12345
    "۱۹/۸".to_f
      => 19.8

Migrating from 0.2 to 0.3
-------------------------

`parsi_digits` renamed to `parsi-digits` to respect bundlers autorequire.
So simple remove `require: 'parsi_digits'` option in `Gemfile` if you have it.

Copyright (c) 2012 Hassan Zamani, released under the MIT license.
