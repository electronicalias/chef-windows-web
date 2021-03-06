## Quick-contribute

* Create an issue on the github [issue tracker](https://github.com/chef-cookbooks/iis/issues)
* Link to your patch as a rebased git branch or pull request from the ticket

## Contributor License Agreement

For all code contributions, we ask that contributors sign a
contributor license agreement (CLA). Instructions may be found here:

* https://supermarket.chef.io/become-a-contributor

## Changelog and Readme files

When contributing changes to individual cookbooks, please do not
modify the version number in the metadata.rb. Also please do not
update the CHANGELOG.md for a new version. Not all changes to a
cookbook may be merged and released in the same versions. Chef will
handle the version updates during the release process. You are welcome
to correct typos or otherwise make updates to documentation in the
README.

## Workflow guidelines

If a contribution adds new platforms or platform versions, indicate
such in the body of the commit message(s), and mention it in the relevant
pull request or github issue. When writing commit messages, it is helpful for others if
you [indicate the Github issue number](https://help.github.com/articles/closing-issues-via-commit-messages/)
in the message.

    git commit -m 'Updated pool resource to correctly delete. Fixes #nn'

On the issue itself, it is also helpful if you include log output of
a successful Chef run, but this is not absolutely required.

### Tests

This cookbook is set up to run tests under [Test Kitchen](http://kitchen.ci/).
You need to follow the latest instructions to have test-kitchen windows support
configured on your machine.  For example, follow this
[blog post](http://kitchen.ci/blog/test-kitchen-windows-test-flight-with-vagrant/)
You should be able to run the ``bundle install`` and then ``bundle exec kitchen test``
to run the integration tests. You must have [VirtualBox](https://www.virtualbox.org/)
and [Vagrant](https://www.vagrantup.com/) installed on your system. In the future we
want to add [ServerSpec](http://serverspec.org/) tests as well.

Your contributions should not break tests and should include additional test
coverage when possible.
