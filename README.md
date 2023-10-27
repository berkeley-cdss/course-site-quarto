# stat999-quarto

Test of a quarto-based template for class repository.

The site is rendered at [https://berkeley-scf.github.io/stat999-quarto](https://berkeley-scf.github.io/stat999-quarto).

## What you can do with this Quarto-based class website and repository

- Create a website by modifying content in a GitHub repository.
- Have the website be searchable.
- Create a dynamic schedule that renders plain text content
- Create documents either using Quarto Markdown (qmd), Jupyter notebook (ipynb), or Markdown files:
   - Include LaTeX (including LaTeX macros) for mathematical notation.
   - Include code chunks that are dynamically evaluated and whose output is included in the document (qmd or ipynb files only).
   - Include external webpages (such as Google calendars) as iframes within a page.
- Quarto features:
   - Quarto provides various nice features (callouts, tabsets, code folding), etc.
   - At the same time one can embed raw HTML for full flexibility.
   - One can use HTML templates  to dynamically populate HTML elements with data from plain text data files (in yml format).
   

## How to use this GitHub template

### Terminology

- "Rendering" a document or a site involves converting the *source* Markdown/notebook file to html, running any code chunks and including output. 
- "Previewing" a site involves rendering the site and displaying locally (i.e., at `localhost:<port>` in a web browser.
- "Publishing" a site involves pushing the rendered site to the `gh-pages` branch of the GitHub repository so it can be viewed at the public URL.

### Instructions [UNDER CONSTRUCTION]

1. Install [Quarto](https://quarto.org/docs/get-started) for Mac, Windows, or Linux.

2. Fork the stat999-quarto repository template. Above the file list click **Use this template** and then **Create a new repository**. Do not enable the **Include all branches*** checkbox.

3. Clone your newly created repository into a local working directory on your computer. For the purposes of these instructions, we'll pretend your repository is at https://github.com/example/stat999-quarto.
```
git clone https://github.com/example/stat999-quarto
mv stat999-quarto stat555-fa24   # do we want semester in there somehow
```

4. Begin making changes relevant to your course. 
   - Modify the site's metadata and table of contents in `_quarto.yml` to reflect the structure you want.
   - Edit the other Markdown (or Quarto Markdown) files in the working directory and add files as desired.
     - You can make use of various Quarto features discussed in the [Quarto docs](https://quarto.org/docs/authoring).
   - Update `schedule.yml` and `buttons.yml` to reflect the material you want displayed in the main page, or move or remove the `#schedule` or `#buttons` items as desired, as well as the accompanying `listing` items in the yaml header of the document.
   
5. Run `quarto preview` to see your site locally. Quarto will bring up the website in a browser tab pointed to a localhost URL, such as `http://localhost:3456`. 

   - You can leave the preview running as you make changes to the source files; saving changes to the source files will generally (with a few exceptions, such as .ejs files) will be reflected live in your browser.

   - You can also run `quarto render` to create the html (in the `_site` directory) without automatically displaying it. Or `quarto render file.qmd` to just render a single file. 

6. Visit github.com and create a new repository for your course website. For the purposes of these instructions, we'll pretend the repository is at https://github.com/example/stat555-site.

7. Set the working directory's upstream git URL to your repository. The URL format will depend on how you normally authenticate to GitHub.
```
# If you use Github personal access tokens for authentication then run this command:
git remote set-url origin https://github.com/example/stat555-site

# Otherwise if you use SSH authentication:
git remote set-url origin git@github.com:example/stat555-site.git
```

8. Next follow some preparatory steps to get your website configured ([documented in the Quarto docs](https://quarto.org/docs/publishing/github-pages.html#publish-command)).

   - Make a `gh-pages` branch for your repository. This is where the rendered files will be stored.

       - From the command line

         ```
         git checkout --orphan gh-pages
         git reset --hard # make sure all changes are committed before running this!
         git commit --allow-empty -m "Initialising gh-pages branch"
         git push origin gh-pages
         git checkout main
         ```

       - Alternatively in your browser, go to `https://github.com/example/stat555` and TOOD.

    - Check that the gh-pages branch as your "Source" under Settings->Pages [give link] 

9. Run `quarto publish gh-pages` from the command line to push updates to the course website.
  - Hit <Y> when prompted to "Update site at https://example.github.io/stat555/? ".
  - Wait a few minutes for the content to be rendered and copied to the GitHub Pages site.
  - You can monitor the site building process at `https://github.com/example/stat555/actions`.
  - If there are no problems, your website will be publicly available at https://example.github.io/stat555 (this might be `github.com/berkeley-stat/stat555-<semester>` or `github.berkeley.edu/statistics`).

10. As you make changes, you can continue to run `quarto publish`. The publishing process saves the rendered files for the webpage to the `gh-pages` branch of your repository. You will also want to save the source files in the `main` (default) branch of your repository.

11. Update your repository with the changes to your source files.
    Tell git about all files that should be in your repo.
    ```
    git add newfile1.md newfile2.md newdirectory3
    ```
      - Commit your changes and push to github:
    ```
    git commit -m "Initial checkin for Stat 555."
    git push
    ```

    If you modify an existing file, you can either do `git add currentfile.md` or include the `-a` flag when you run `git commit` to automatically update files that Git is already keeping track of, e.g., `git commit -am "Updated Unit 7"`.

12. We can give your website a more friendly URL, such as https://stat555.berkeley.edu. Just let us know when your website is ready.
