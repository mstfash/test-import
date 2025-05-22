# Test Import Project

This is a test project that demonstrates GitHub Actions workflow for automated releases.

## Features

- Automated releases on version tags
- NPM package publishing
- Docker image building and pushing
- Slack notifications

## Getting Started

1. Clone the repository
2. Install dependencies: `npm install`
3. Run tests: `npm test`
4. Build the project: `npm run build`

## Release Process

To create a new release:
1. Create and push a new tag: `git tag v1.0.0`
2. Push the tag: `git push origin v1.0.0`

The GitHub Actions workflow will automatically:
- Create a GitHub release
- Publish to NPM
- Build and push Docker images
- Send Slack notifications 

[test](https:google.com)
