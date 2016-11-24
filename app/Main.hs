{-# LANGUAGE OverloadedStrings  #-}

module Main where
import              Web.Scotty              as S
import qualified    Data.Text.Lazy          as T
import              Control.Monad
import              Control.Monad.IO.Class  (liftIO)
import              Network.Wai.Middleware.Static
-- import              Web.Scotty.TLS
-- import              Network.Wai.Handler.WarpTLS
-- scottyTLSSettings 80 defaultTlsSettings --> when I get TLS certificate
main = scotty 8443 $ do
    middleware $ staticPolicy $ hasPrefix "static/"
    S.get "/" $ indexScottyHtml
    -- S.get "/"

indexScottyHtml = do c <- liftIO $ readFile "static/index.html"
                     S.html $ T.pack c
