# dslim
##Overview
Prior to a somewhat functional version this readme will endure as an informal functional spec.
Everything will be revised several times before it is finalized.

Why implement Slim in D and not just use CSlim?
- it's fun
- it's good exercise
- with D I should be able to do a better version than CSlim

Advantages over CSlim:
There is no need to write separate functions that take a member struct as first parameter and registering them with macros. Instead some directory is passed to a small utility. Public classes of every module within this directory are considered fixtures. No additional gluing or annotation required.

##Non Goals
This version will not support the following features:
- addition of fixture modules at runtime
> **TODO:**
> add another item or two
