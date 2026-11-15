# Publishing the static project site

ASTROLENZA is a static HTML package. The intended root `index.html` is the project launch page and links to the visor, briefing, PDF and provenance notes. No server-side runtime or build step is required for the current demonstration.

## GitHub Pages

1. Open repository **Settings → Pages**.
2. Set the deployment source to **GitHub Actions**.
3. Push to `main` or manually dispatch the Pages workflow.
4. Wait for the Pages deployment job to complete successfully.
5. Verify the published landing page, visor, briefing and PDF from a private browser window.

The workflow uses GitHub's Pages actions and the minimum job permissions for Pages deployment. Do not enable publication until the full HTML and media payload is present in the repository; a landing page with missing relative assets is not a complete release.

## Release discipline

- Confirm `MANIFEST.sha256` against the committed files.
- Verify embedded media redistribution rights.
- Check that no credentials, private telemetry, personal information or medical records are present.
- Re-run the browser, responsive and presentation checks against the release commit.
- Tag the reviewed commit (for example, `v19.0.0`) only after the full release payload is in place.
