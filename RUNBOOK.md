# Doppler CircleCI Orb

CircleCI orb to use doppler in your CircleCI pipelines.

## Code

doppler-circleci-orb

## Service Tier

Bronze

## Host Platform

CircleCI

## Contains Personal Data

No

## Contains Sensitive Data

No

## Lifecycle Stage

Production

## First Line Troubleshooting

Currently does the following:

- At build time, installs doppler via a shell script
- Retrieves secrets from a specified doppler project, based on the given doppler token.

No action should be required from the Operations Support team, but please speak to code-management if you need more information.

## Monitoring

As this is a CircleCI orb, there is limited monitoring avaialable. Therefore, this is not applicable.

## Failover Architecture Type

None

## Failover Process Type

None

## Failback Process Type

None

## Failover Details

N/A

## Data Recovery Process Type

None

## Data Recovery Details

N/A

## Release Process Type

PartiallyAutomated

## Rollback Process Type

Manual

## Release Details

Release process is automated via CircleCI.
A new orb version will be published upon a new GitHub release.

### Resources

[CircleCI Orb Registry Page](https://circleci.com/developer/orbs/orb/financial-times/doppler-circleci) - The official registry page of this orb for all versions, executors, commands, and jobs described.

[CircleCI Orb Docs](https://circleci.com/docs/orb-intro/#section=configuration) - Docs for using, creating, and publishing CircleCI Orbs.

#### How to Contribute

We welcome [issues](https://github.com/Financial-Times/doppler-circleci-orb/issues) to and [pull requests](https://github.com/Financial-Times/doppler-circleci-orb/pulls) against this repository!

#### How to Publish An Update

1. Merge pull requests with desired changes to the main branch.
    - For the best experience, squash-and-merge and use [Conventional Commit Messages](https://conventionalcommits.org/).
2. Find the current version of the orb.
    - You can run `circleci orb info financial-times/doppler-circleci | grep "Latest"` to see the current version.
3. Create a [new Release](https://github.com/Financial-Times/doppler-circleci-orb/releases/new) on GitHub.
    - Click "Choose a tag" and _create_ a new [semantically versioned](http://semver.org/) tag. (ex: v1.0.0)
      - We will have an opportunity to change this before we publish if needed after the next step.
4. Click _"+ Auto-generate release notes"_.
    - This will create a summary of all of the merged pull requests since the previous release.
    - If you have used _[Conventional Commit Messages](https://conventionalcommits.org/)_ it will be easy to determine what types of changes were made, allowing you to ensure the correct version tag is being published.
5. Now ensure the version tag selected is semantically accurate based on the changes included.
6. Click _"Publish Release"_.
    - This will push a new tag and trigger your publishing pipeline on CircleCI.

## Key Management Process Type

NotApplicable

## Architecture

This is a publicly available orb.

The full orb can be viewed at https://github.com/Financial-Times/doppler-circleci-orb

The repository holds the orb data including the src which contains essential components for the orb, such as the install and load secrets scripts.
