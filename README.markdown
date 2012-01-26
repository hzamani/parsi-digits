ParsiDigits
===========

Some simple utilities to help working with parsi unicode digits.

Convertion between parsi and western digits:

    require 'parsi_digits'
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

Copyright (c) 2012 Hassan Zamani, released under the MIT license.
