# Guide for Triagers

This directory contains scripts and documentation for the triage team who 
facilitate the Bug BBQ. If you are a regular participant, please see the main 
[README](/README.md).

## Adding Bugs

To add a bug from R's Bugzilla as an issue to this repo, you can use or modify 
the code in `add_bug.R`.

Bugs are labelled automatically by their component and you should add one of 
the custom labels described in the main README: 
 - `needs reprex`
 - `check in r-devel`
 - `needs diagnosis`
 - `discuss fix`
 - `needs patch`
A `review patch` label may also be used. 

We will not consider bugs from components "Installation", 
"Mac GUI / Mac specific", "System-specific", "Windows GUI / Window specific", 
or "Wishlist".

## Triaging bugs 

As bugs are updated on Bugzilla or during the Bug BBQ, the corresponding issues 
on this repo will need to be curated.

Bugs changed on Bugzilla since being posted here should be reviewed prior to 
the Bug BBQ and the labels should be updated or the issue should be closed 
as appropriate.

During the Bug BBQ, participants will tag the triage team with 
`@r-devel/triagers`. Triagers should review comments on the issue and update 
labels/close the issue as appropriate.
