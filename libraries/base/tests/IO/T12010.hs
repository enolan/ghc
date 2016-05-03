module Main where
import Control.Monad
import Data.ByteString.Char8 as B
import Network.Socket
import System.IO (IOMode(..))

main :: IO ()
main = do
  sock <- socket AF_INET Stream defaultProtocol
  h <- socketToHandle sock ReadWriteMode
  void $ B.hGet h 4096 -- This is always an error, but with #12010 it's a segfault.
