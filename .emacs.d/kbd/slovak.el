;;; slovak.el --- Quail package for inputting Slovak  -*-coding: iso-2022-7bit;-*-

;; Copyright (C) 1998, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011
;;   Free Software Foundation, Inc.

;; Authors: Tibor ,B)(Bimko <tibor.simko@fmph.uniba.sk>
;;	Milan Zamazal <pdm@zamazal.org>
;; Maintainer: Pavel Jan,Bm(Bk <Pavel@Janik.cz>
;; Keywords: i18n, multilingual, input method, Slovak

;; QWERTY version by Sergej Chodarev

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This file defines QWERTY Slovak keyboard

;;; Code:

(require 'quail)


(quail-define-package
 "slovak-qwerty" "Slovak" "SK" t
 "Slovak QWERTY keyboard."
 nil t nil nil t nil nil nil nil nil t)

(quail-define-rules
 ("1" ?+)
 ("2" ?,B5(B)
 ("3" ?,B9(B)
 ("4" ?,Bh(B)
 ("5" ?,B;(B)
 ("6" ?,B>(B)
 ("7" ?,B}(B)
 ("8" ?,Ba(B)
 ("9" ?,Bm(B)
 ("0" ?,Bi(B)
 ("!" ?1)
 ("@" ?2)
 ("#" ?3)
 ("$" ?4)
 ("%" ?5)
 ("^" ?6)
 ("&" ?7)
 ("*" ?8)
 ("(" ?9)
 (")" ?0)
 ("-" ?=)
 ("_" ?%)
 ("=" ?')
 ("[" ?,Bz(B)
 ("{" ?/)
 ("]" ?,Bd(B)
 ("}" ?\()
 ("\\" ?,Br(B)
 ("|" ?\))
 (";" ?,Bt(B)
 (":" ?\")
 ("'" ?,B'(B)
 ("\"" ?!)
 ("<" ??)
 (">" ?:)
 ("/" ?-)
 ("?" ?_)
 ("`" ?\;)
 ("~" ?^)
 ("y" ?y)
 ("z" ?z)
 ("Y" ?Y)
 ("Z" ?Z)
 ("=a" ?,Ba(B)
 ("+a" ?,Bd(B)
 ("+=a" ?,Bd(B)
 ("+c" ?,Bh(B)
 ("+d" ?,Bo(B)
 ("=e" ?,Bi(B)
 ("+e" ?,Bl(B)
 ("=i" ?,Bm(B)
 ("=l" ?,Be(B)
 ("+l" ?,B5(B)
 ("+n" ?,Br(B)
 ("=o" ?,Bs(B)
 ("+o" ?,Bt(B)
 ("~o" ?,Bt(B)
 ("+=o" ?,Bv(B)
 ("=r" ?,B`(B)
 ("+r" ?,Bx(B)
 ("=s" ?,B_(B)
 ("+s" ?,B9(B)
 ("+t" ?,B;(B)
 ("=u" ?,Bz(B)
 ("+u" ?,By(B)
 ("+=u" ?,B|(B)
 ("+z" ?,B>(B)
 ("=y" ?,B}(B)
 ("=A" ?,BA(B)
 ("+A" ?,BD(B)
 ("+=A" ?,BD(B)
 ("+C" ?,BH(B)
 ("+D" ?,BO(B)
 ("=E" ?,BI(B)
 ("+E" ?,BL(B)
 ("=I" ?,BM(B)
 ("=L" ?,BE(B)
 ("+L" ?,B%(B)
 ("+N" ?,BR(B)
 ("=O" ?,BS(B)
 ("+O" ?,BT(B)
 ("~O" ?,BT(B)
 ("+=O" ?,BV(B)
 ("=R" ?,B@(B)
 ("+R" ?,BX(B)
 ("=S" ?,B_(B)
 ("+S" ?,B)(B)
 ("+T" ?,B+(B)
 ("=U" ?,BZ(B)
 ("+U" ?,BY(B)
 ("+=U" ?,B\(B)
 ("+Z" ?,B.(B)
 ("=Y" ?,B](B)
 ("=q" ?`)
 ("=2" ?@)
 ("=3" ?#)
 ("=4" ?$)
 ("=5" ?%)
 ("=6" ?^)
 ("=7" ?&)
 ("=8" ?*)
 ("=9" ?\()
 ("=0" ?\))
 ("+1" ?!)
 ("+2" ?@)
 ("+3" ?#)
 ("+4" ?$)
 ("+5" ?%)
 ("+6" ?^)
 ("+7" ?&)
 ("+8" ?*)
 ("+9" ?\()
 ("+0" ?\))
 ([kp-1] ?1)
 ([kp-2] ?2)
 ([kp-3] ?3)
 ([kp-4] ?4)
 ([kp-5] ?5)
 ([kp-6] ?6)
 ([kp-7] ?7)
 ([kp-8] ?8)
 ([kp-9] ?9)
 ([kp-0] ?0)
 ([kp-add] ?+))

