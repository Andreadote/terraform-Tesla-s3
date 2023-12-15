
module.exports = {
branches: "main",
repositoryUrl: "https://github.com/Andreadote/terraform-Tesla-s3.git",
plugins: [
  '@semantic-release/commit-analyzer',
  '@semantic-release/release-notes-generator',
  '@semantic-release/git',
  '@semantic-release/github']
 }