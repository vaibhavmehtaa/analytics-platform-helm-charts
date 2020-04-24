## [0.2.11] - 2020-04-24
### Changed
- Add if/else statement to enable disable nbstripout hook

## [0.2.10] - 2020-03-31
### Changed
- Export PATH for rstudio and jupyter for dev and alpha environments 

## [0.2.9] - 2020-03-23
### Changed
- Add -R to $GIT_TEMPLATES to set hooks as executables

## [0.2.8] - 2020-03-18
### Changed
- Add full path to nbstripout (~/.local/bin/nbstripout)
- Add quotes to '~/.git-templates' as it's resolving "~" as root

## [0.2.7] - 2020-03-17
### Changed
- Change git config init.templatedir to ~/.git-templates instead of /home/user/.git-templates

## [0.2.6] - 2020-03-13
### Added
- Chown for staff on `GIT_TEMPLATES` folder to copy hooks to project .git/hooks
- `CHANGELOG.md`
