# GitHub publication — ASTROLENZA v19

Repository: https://github.com/Sunny-develops/ASTROLENZA-NASA-
Default branch: main

## Publish the complete release from Windows

The GitHub connector can maintain text-based project documentation. To transfer the complete 70 MB executable/media tree, use local Git so binary assets are transferred as binary files rather than converted to text.

1. Download ASTROLENZA_GitHub_Release.zip and Publish-To-GitHub.ps1 from the handover links.
2. Install Git for Windows if Git is not already installed: https://git-scm.com/download/win
3. Authenticate to GitHub when Git Credential Manager opens the browser. Use the Sunny-develops account.
4. Open PowerShell in the folder containing the script and run:

    Set-ExecutionPolicy -Scope Process Bypass
    .\Publish-To-GitHub.ps1 -ZipPath "$HOME\Downloads\ASTROLENZA_GitHub_Release.zip"

The script verifies the package SHA-256 manifest and required visor/briefing assets, clones or fast-forwards the existing main branch, refuses to overwrite a dirty local clone, copies the package contents into the clone, commits and pushes. It does not force-push or store credentials in the project.

Optional destination override:

    .\Publish-To-GitHub.ps1 -ZipPath "$HOME\Downloads\ASTROLENZA_GitHub_Release.zip" -RepositoryPath "$HOME\source\ASTROLENZA-NASA-"

## Alternative: GitHub Desktop

1. Clone Sunny-develops/ASTROLENZA-NASA- using GitHub Desktop.
2. Extract the release ZIP.
3. Copy the contents inside the extracted ASTROLENZA_GitHub_Release directory into the cloned repository root. Merge folders; do not nest the wrapper folder.
4. Review the changes, commit with "release: publish ASTROLENZA v19 complete project", then push to main.

GitHub browser uploads are limited to 25 MiB per file; command-line Git supports files up to 100 MiB each. Use the Git workflow instead of uploading the 58 MB archive through the browser. See GitHub's file upload guidance:
https://docs.github.com/en/repositories/working-with-files/managing-files/adding-a-file-to-a-repository

## GitHub Pages

After the complete release tree is pushed, open Settings > Pages and set Build and deployment > Source to GitHub Actions. The workflow verifies that the visor, briefing and PDF exist before deployment. Confirm the Actions run and published URL before sharing it.

Expected URL: https://sunny-develops.github.io/ASTROLENZA-NASA-/. Verify it in Settings > Pages after a successful deployment.

## Public-release checks

- Verify redistribution rights for photographs, suit artwork, logos, fonts and embedded media.
- Preserve synthetic-data and prototype-only disclaimers.
- Confirm no .env, credentials, tokens, personal information or actual crew/medical records are present.
- Re-run visor, presentation and responsive checks against the exact pushed commit.
