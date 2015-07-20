# Utility Functions

These should probably all go somewhere else. For the moment, this is a holding pen of sorts for functions that we're not sure what to do with.

## abort

Simple wrapper around `process.exit(-1)`.

    abort = (message) ->
      console.error message if message?
      process.exit -1

## shell

Execute a shell command. Returns a promise that resolves to an object with properties `stdout` and `stdin`, or is rejected with an error.

    shell = (command) ->
      {promise} = require "when"
      {exec} = require "child_process"
      promise (resolve, reject) ->
        exec command, (error, stdout, stderr) ->
          if error
            reject error
          else
            resolve {stdout, stderr}
---

    module.exports = {abort, shell}
