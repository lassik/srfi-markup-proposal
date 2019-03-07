
(syntax buffer-mode
  (arg name))

(procedure buffer-mode?
  (arg obj))

(syntax transcoder
  (sublist
    (quoted-symbol codec)
    (arg codec))
  (sublist
    (quoted-symbol eol-style)
    (arg eol-style)))

(syntax update-transcoder
  (arg old)
  (sublist
    (quoted-symbol codec)
    (arg codec))
  (sublist
    (quoted-symbol eol-style)
    (arg eol-style)))

(syntax eol-style
  (quoted-symbol lf))

(syntax eol-style
  (quoted-symbol crlf))

(syntax eol-style
  (quoted-symbol cr))

(variable latin-1-codec)

(variable utf-16le-codec)

(variable utf-16be-codec)

(variable utf-32le-codec)

(variable utf-32be-codec)

(procedure input-port?
  (arg obj))

(procedure read-blob-some
  (arg input-port))

(procedure read-u8
  (arg input-port))

(procedure read-blob-n
  (arg input-port)
  (arg n))

(procedure read-blob-n!
  (arg input-port)
  (arg blob)
  (arg start)
  (arg count))

(procedure read-blob-all
  (arg input-port))

(procedure read-string
  (arg input-port))

(procedure read-char
  (arg input-port))

(procedure read-string-n
  (arg input-port)
  (arg n))

(procedure read-string-n!
  (arg input-port)
  (arg string)
  (arg start)
  (arg count))

(procedure read-string-all
  (arg input-port))

(procedure peek-u8
  (arg input-port))

(procedure peek-char
  (arg input-port))

(procedure port-eof?
  (arg input-port))

(procedure input-port-position
  (arg input-port))

(procedure set-input-port-position!
  (arg input-port)
  (arg pos))

(procedure transcode-input-port!
  (arg input-port)
  (arg transcoder))

(procedure close-input-port
  (arg input-port))

(procedure open-file-input-port
  (arg filename))

(procedure open-file-input-port
  (arg filename)
  (arg file-options))

(procedure open-file-input-port
  (arg filename)
  (arg file-options)
  (arg transcoder))

(procedure open-blob-input-port
  (arg blob))

(procedure open-blob-input-port
  (arg blob)
  (arg transcoder))

(procedure open-string-input-port
  (arg string))

(procedure open-string-input-port
  (arg string)
  (arg transcoder))

(procedure call-with-input-port
  (arg input-port)
  (arg proc))

(procedure standard-input-port)

(procedure output-port?
  (arg obj))

(procedure write-blob
  (arg output-port)
  (arg blob))

(procedure write-blob
  (arg output-port)
  (arg blob)
  (arg start))

(procedure write-blob
  (arg output-port)
  (arg blob)
  (arg start)
  (arg count))

(procedure write-u8
  (arg output-port)
  (arg octet))

(procedure write-string-n
  (arg output-port)
  (arg string))

(procedure write-string-n
  (arg output-port)
  (arg string)
  (arg start))

(procedure write-string-n
  (arg output-port)
  (arg string)
  (arg start)
  (arg count))

(procedure write-char
  (arg output-port)
  (arg char))

(procedure newline
  (arg output-port))

(procedure flush-output-port
  (arg output-port))

(procedure output-port-buffer-mode
  (arg output-port))

(procedure set-output-port-buffer-mode!
  (arg output-port)
  (arg buffer-mode))

(procedure output-port-position
  (arg output-port))

(procedure set-output-port-position!
  (arg output-port)
  (arg pos))

(procedure transcode-output-port!
  (arg output-port)
  (arg transcoder))

(procedure close-output-port
  (arg output-port))

(procedure open-file-output-port
  (arg filename))

(procedure open-file-output-port
  (arg filename)
  (arg file-options))

(procedure open-file-output-port
  (arg filename)
  (arg file-options)
  (arg transcoder))

(procedure call-with-blob-output-port
  (arg proc))

(procedure call-with-blob-output-port
  (arg proc)
  (arg transcoder))

(procedure call-with-string-output-port
  (arg proc))

(procedure call-with-string-output-port
  (arg proc)
  (arg transcoder))

(procedure call-with-output-port
  (arg output-port)
  (arg proc))

(procedure standard-output-port)

(procedure standard-error-port)

(procedure open-file-input+output-ports
  (arg filename))

(procedure open-file-input+output-ports
  (arg filename)
  (arg file-options))

(procedure open-file-input+output-ports
  (arg filename)
  (arg file-options)
  (arg transcoder))

(procedure open-reader-input-port
  (arg reader))

(procedure open-reader-input-port
  (arg reader)
  (arg transcoder))

(procedure open-writer-output-port
  (arg writer)
  (arg buffer-mode))

(procedure open-writer-output-port
  (arg writer)
  (arg buffer-mode)
  (arg transcoder))
