/**
 * Copyright (c) 2012 Partners In Health.  All rights reserved.
 * The use and distribution terms for this software are covered by the
 * Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
 * which can be found in the file epl-v10.html at the root of this distribution.
 * By using this software in any fashion, you are agreeing to be bound by
 * the terms of this license.
 * You must not remove this notice, or any other, from this software.
 **/
package org.pih.warehouse

import org.apache.commons.codec.binary.Base64

import java.security.MessageDigest

class PasswordCodec {
    static encode = { String str ->
        MessageDigest md = MessageDigest.getInstance('SHA')
        md.update(str.getBytes('UTF-8'))
        return new String(Base64.encodeBase64(md.digest()))
    }
}
