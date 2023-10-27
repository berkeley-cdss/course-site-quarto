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

These instructions have been tested under MacOS.

Current problems/questions:
  - **Use this template** is only available if logged in to GitHub. Not sure if it will be available to someone else who is logged in.
  - What format should we use for class repo names for individual semesters, e.g., stat555-sp24, stat555-spring-2024, etc..
  - What github.com or github.b.e account should instructors use? Perhaps github.com/berkeley-stat or github.b.e/berkeley-stat or github.b.e/statistics

1. Install [Quarto](https://quarto.org/docs/get-started) for Mac, Windows, or Linux.

2. First, fork the `stat999-quarto` repository template as follows:
   - Go to `github.com/berkeley-scf/stat999-quarto`. 
   - Above the file list click **Use this template** and then **Create a new repository**. This will then bring you to a screen where you'll configure your new repository. 
   - Do not enable the **Include all branches*** checkbox.
   - Choose your repository name to follow this pattern: `stat-555-fa23` [TBD]
   - You might choose the default of having your repository be public or choose that it be private while you are setting things up. Or you might choose for it always to be private.
   - Click on **Create Repository**.
   
3. [Install Git](https://git-scm.com/downloads) if you don't have it installed.

4. Clone your newly created repository into a local working directory on your computer. For the purposes of these instructions, we'll pretend your repository is at https://github.com/example/stat999-quarto.  
   - You can do this from the terminal/commandline or within a Git graphical application (e.g., `GitHub Desktop`) or from within RStudio.
   - From the terminal it would look like this:
     ```
     git clone https://github.com/example/stat555
     ```

4. Begin making changes relevant to your course. 
   - Modify the site's metadata and table of contents in `_quarto.yml` to reflect the structure you want.
   - Update `README.md` to remove all the instructions we provide (i.e., this text you are reading!).
   - Edit the other Markdown (or Quarto Markdown) files in the working directory and add files as desired.
     - You can make use of various Quarto features discussed in the [Quarto docs](https://quarto.org/docs/authoring).
   - Update `schedule.yml` and `buttons.yml` to reflect the material you want displayed in the main page, or move or remove the `#schedule` or `#buttons` items as desired, as well as the accompanying `listing` items in the yaml header of the document.
   
5. Run `quarto preview` to see your site locally. Quarto will bring up the website in a browser tab pointed to a localhost URL, such as `http://localhost:3456`. 

   - You can leave the preview running as you make changes to the source files; saving changes to the source files will generally (with a few exceptions, such as .ejs files) will be reflected live in your browser.

   - You can also run `quarto render` to create the html (in the `_site` directory) without automatically displaying it. Or `quarto render file.qmd` to just render a single file. 
      - Note that you shouldn't commit the files in `_site` to your repository as they will be frequently regenerated and having them in the repository can complicate matters.
      
6. Update your repository with the changes to your source files.

    - Tell git about all files that should be in your repo.
      ```
      git add newfile1.md newfile2.md newdirectory3
      ```
    - Commit your changes and push to github:
      ```
      git commit -m "Initial checkin for Stat 555."
      git push
      ```

    If you modify an existing file, you can either do `git add currentfile.md` or include the `-a` flag when you run `git commit` to automatically update files that Git is already keeping track of, e.g., after modifying unit 7 files, `git commit -am "Updated Unit 7"`.
      

7. Next follow some preparatory steps to get your website configured ([as documented in the Quarto docs](https://quarto.org/docs/publishing/github-pages.html#publish-command)).

   - Make a `gh-pages` branch for your repository. This is where the rendered files will be stored.

       - From the command line
         ```
         git checkout --orphan gh-pages
         git reset --hard # make sure all changes are committed before running this (see step 5 above)!
         git commit --allow-empty -m "Initializing gh-pages branch"
         git push origin gh-pages
         git checkout main
         ```
       - Alternatively in your browser, go to `https://github.com/example/stat555/branches` and click on **New branch" and give it the name `gh-pages`.

    - Check that the `gh-pages` branch ais your source branch under [Settings->Pages->Branch](github.com/example/stat555/settings/pages).

7. Run `quarto publish gh-pages` from the command line to push updates to the course website.
  - Hit <Y> when prompted to "Update site at https://example.github.io/stat555/? ".
  - Wait a minute for the content to be rendered on your computer. You should then see a message about updating files in the `gh-pages` branch.
  - Wait a minute for the content to be copied to the GitHub Pages site.
  - You can monitor the site building process at `https://github.com/example/stat555/actions`.
  - If there are no problems, your website will be publicly available at https://example.github.io/stat555. Once Step 10 below is done, it should be available at the standardized location.

8. As you make changes, you can continue to run `quarto publish gh-pages`. The publishing process saves the rendered files for the webpage to the `gh-pages` branch of your repository. You will also want to regularly save (i.e., commit any changes to) the source files in the `main` (default) branch of your repository (Step 6).

9. We will work with you to give your website a friendly URL in a department-standardized format, such as https://stat555.berkeley.edu. Just let us know when your website is ready.

The SCF is happy to help. Please [contact us](https://statistics.berkeley.edu/computing/how-get-help) if you are a Berkeley Statistics instructor and you run into problems or questions.
