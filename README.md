# Deploy to Firebase Functions and Hosting for Node

A GitHub Action to deploy to Firebase Cloud Functions and Firebase Hosting for Node.

- Make sure that you checkout the repository using the [actions/checkout](https://github.com/actions/checkout) action
- Make sure that you have the `firebase.json` file in the repository
- To obtain the Firebase token, run `firebase login:ci` on your local computer and [store the token](https://docs.github.com/en/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-a-repository) as the `FIREBASE_TOKEN` secret
- Specify the Firebase project name in the `FIREBASE_PROJECT` env var

## Workflow examples

### Node 20 ([Preview](https://firebase.google.com/docs/functions/manage-functions?gen=1st#set_nodejs_version_2))

Deploy the `main` branch when a commit is pushed to it:

```yml
name: Deploy the main branch
on:
  push:
    branches:
      - main
jobs:
  main:
    name: Deploy to Firebase
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: polaroid/deploy-firebase-functions@v20.0.0
      env:
        FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
        FIREBASE_PROJECT: firebase-project-id
```

Deploy only when a tag starts with `v` is pushed:

```yml
name: Deploy a tag
on:
  push:
    tags:
      - v*
jobs:
  main:
    name: Deploy to Firebase
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: polaroid/deploy-firebase-functions@v20.0.0
      env:
        FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
        FIREBASE_PROJECT: firebase-project-id
```

### Node 18

Deploy the `main` branch when a commit is pushed to it:

```yml
name: Deploy the main branch
on:
  push:
    branches:
      - main
jobs:
  main:
    name: Deploy to Firebase
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: polaroid/deploy-firebase-functions@v18.0.0
      env:
        FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
        FIREBASE_PROJECT: firebase-project-id
```

Deploy only when a tag starts with `v` is pushed:

```yml
name: Deploy a tag
on:
  push:
    tags:
      - v*
jobs:
  main:
    name: Deploy to Firebase
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: polaroid/deploy-firebase-functions@v18.0.0
      env:
        FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
        FIREBASE_PROJECT: firebase-project-id
```
