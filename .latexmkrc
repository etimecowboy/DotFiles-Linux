######################################################################
# Old backup
######################################################################

# $pdflatex = "xelatex -synctex=1 %O %S";
# $pdf_mode = 1;
# $pdf_previewer = "start okular --unique %O %S";
# $cleanup_mode = 2;

######################################################################
# RC file (latexmk makefile) for my TeX file compilation
######################################################################

# Use if -pvc ($preview_continuous_mode) is NOT active, so that terminal can launch previewer.  Otherwise, a conflict exists.
# $preview_mode = 1;

# -pvc equivalent.  If nonzero, run a previewer to view the document and keep the DVI file up to date.
# $preview_continuous_mode = 1;

# The name of the LaTeX program that produces PDF files by default
# $pdflatex = 'pdflatex %O -interaction=nonstopmode -synctex=1 %S';
# $latex = 'latex -shell-escape -synctex=1 %O %S';
# $pdflatex = "xelatex -shell-escape -synctex=1 %O %S";
# $pdflatex = "xelatex -shell-escape -interaction=nonstopmode -synctex=1 %O %S";
$pdflatex = "xelatex -shell-escape -synctex=1 %O %S";

# If nonzero, continue processing past minor LaTeX errors.  This option is made nonzero if the -pvc command line option is used.
$force_mode = 1;

# The command to invoke a PDF previewer
# $pdf_previewer = 'open -a /Applications/Adobe\ Acrobat\ 9\ Pro/Adobe\ Acrobat\ Pro.app';
# $pdf_previewer = 'open -a Skim.app %O %S';
# $pdf_previewer = 'Start %HOME%/.emacs.d/bin/win32/SumatraPDF.exe -reuse-instance %O %S';
$pdf_previewer = "okular --unique %O %S";
# $pdf_previewer = "mupdf -b 8 -r 96 %O %S";
# $pdf_previewer = "evince %O %S";

# 0 = do not create a PDF file
# 1 = Create a PDF file with pdflatex
# 2 = Create a PDF file with ps2pdf
# 3 = Create a PDF file with dvipdf
$pdf_mode = 1;

# Extra file extensions to remove when cleaning
$clean_ext = 'synctex.gz synctex.gz(busy) acn acr alg aux bbl bcf blg brf fdb_latexmk glg glo gls idx ilg ind ist lof log lot out run.xml toc dvi';

# Extra file extensions to remove when doing a full clean
# $clean_full_ext = 'synctex.gz synctex.gz(busy) acn acr alg aux bbl bcf blg brf fdb_latexmk glg glo gls idx ilg ind ist lof log lot out run.xml toc dvi';

# Whether to clean latexmk's file database too
# $cleanup_fdb = 1;

# Whether cleanup deletes files generated by custom dependencies
# $cleanup_includes_cusdep_generated = 0

# Whether cleanup deletes files generated by (pdf)latex, found from \openout
# lines in the log file.
# $cleanup_includes_generated = 0

# How much cleaning to do: 0 specifies normal operation (no cleaning),
# 1 specifies a full cleanup, and 2 specifies a cleanup that leaves DVI,
# PostScript, and PDF files.
# $cleanup_mode = 0;
$cleanup_mode = 1;

# Whether to just cleanup, or also generate files
# $cleanup_only = 0;

######################################################################
# TODO:
######################################################################

# Whether to read rc files automatically
# $auto_rc_use = 1;

# Directory for output files
# $out_dir = '/tmp';

# Directory for aux files (log, aux, etc.)
# $aux_dir = '/tmp';

# Default switches to pass to the pdflatex program
# $pdflatex_default_switches = '';

# If zero, check for a previously running previewer on the same file and update it.  If nonzero, always start a new previewer.
# $new_viewer_always = 0;

# The command to run when the PDF viewer is set to be updated by a command
# $pdf_update_command = '-a /Applications/Adobe\ Acrobat\ 9\ Pro/Adobe\ Acrobat\ Pro.app %R -reload';

# How to make the PDF viewer update its display when the PDF file changes.  See the man page for a description of each method.
$pdf_update_method = 1; # 1 under Unix; 3 under MS-Windows

# This does NOT apply to pdflatex, unfortunately.
# $always_view_file_via_temporary = 1;

# This does NOT apply to pdflatex, unfortunately.  The same as $always_view_file_via_temporary, except that it only applies in preview-continuous mode (-pvc option).
# $pvc_view_file_via_temporary = 1;

# When PDF update method 2 is used, the number of the Unix signal to send
# $pdf_update_signal = $signo{HUP}

# The command line switch to make pdflatex run in silent mode, but halts on any error, so you have to go through and look at the log files if anything is awry.
# $pdflatex_silent_switch = '-interaction=batchmode';
# $pdflatex_silent_switch = "-interaction=batchmode -c-style-errors";
$pdflatex_silent_switch = '-interaction=nonstopmode';

# If nonzero, DVI-to-postscript conversion adds a banner message on each page
# $banner = 0;

# The darkness of the banner, a number between 0 (black) and 1 (white)
# $banner_intensity = 0.95;

# The banner message to print across each page if $banner is nonzero
# $banner_message = 'DRAFT';

# The size of the banner message (about 1100 divided by the message length)
# $banner_scale = 220;

# Directories where BibTeX should look for .bib files.
# $BIBINPUTS = $ENV('BIBINPUTS') || '.'

# The name of the biber executable
$biber = 'biber %O %B';

# The switch that puts biber in silent mode
$biber_silent_switch = '--onlylog';

# The name of the BibTeX executable
$bibtex = 'bibtex %O %B';

# The switch that puts BibTeX in silent mode
$bibtex_silent_switch = '-terse';

# Whether to run bibtex to update bbl files: 0 means never run bibtex, 1 means
# run bibtex only if the source files exist and the bbl files are out of date,
# 2 means run bibtex whenever the bbl files are out of date.
$bibtex_use = 1;

# A custom dependency list; see the man page for details
# @cus_dep_list = ();

# The default list of files to not be processed; see the man page for details
# @default_excluded_files = ( );

# The default list of files to be processed; see the man page for details
# @default_files = ('*.tex');

# Whether to display lists of dependencies
# $dependents_list = 0;

# Whether lists of dependencies include phony targets
# $dependents_phony = 0;

# File for dependency list output.  Default is stdout.
# $deps_file = '-';

# Whether to get diagnostic output from latexmk
# $diagnostics = 0;

# Whether to change to the directory of the source file
# $do_cd = 0;

# The DVI file filter to be run on newly produced DVI files
# $dvi_filter = '';

# Always make a DVI file
# $dvi_mode = 0;

# The command to start a DVI previewer
# $dvi_previewer = 'start xdvi %O %S';
# $dvi_previewer = 'xdg-open %O %S';

# The command to start a DVI previewer in landscape mode
# $dvi_previewer_landscape = 'start xdvi -paper usr %O %S';
# $dvi_previewer_landscape = 'xdg-open %O %S';

# The command to run when the DVI viewer is set to be updated by a command
# $dvi_update_command = '';

# How to make the DVI viewer update its display when the DVI file changes.
# See the man page for a description of each method.
# $dvi_update_method = 2;
# $dvi_update_method = 1;

# When DVI update method 2 is used, the number of the Unix signal to send
# $dvi_update_signal = $signo{USR1}

# The command to convert a DVI file into a PDF file.
# See the warnings on the man page
# $dvipdf = 'dvipdf %O %S %D';
# The command to convert a DVI file into a PostScript file
# $dvips = 'dvips %O -o %D %S';

# The command to convert a DVI file into a PostScript file in landscape mode
# $dvips_landscape = 'dvips -tlandscape %O -o %D %S';

# Command line switch for dvips when a PDF file is to be generated
# $dvips_pdf_switch = '-P pdf';

# Command line switch for dvips to make it run in silent mode
# $dvips_silent_switch = '-q';

# Which treatment of default extension and filenames with multiple extensions
# is used.  The possibilities are:
#   - miktex_old, for MikTeX version 1.20d or earlier
#   - unix, for web2c 7.3.1 or later
# $extension_treatment = 'unix';

# The extension of the file which latexmk generates to contain a database
# of information on source files.
# $fdb_ext = 'fdb_latexmk';

# Version number for kind of fdb_file
# $fdb_ver = 3;

# The list of extensions for files that are generated in one run and consumed
# by later runs of one of the LaTeX tools.  The 'aux' and 'bbl' extensions are
# treated specially.
# @generated_exts = ( 'aux', 'bcf', 'fls', 'idx', 'ind', 'lof', 'lot', 'out', 'toc' );

# 1 = process files regardless of timestamps
# 2 = do a full cleanup first
# $go_mode = 0;

# The basename of generated files
# $jobname = "";

# The command to search for tex-related files
# $kpsewhich = 'kpsewhich %S';

# If nonzero, run in landscape mode; otherwise in portrait mode
# $landscape_mode = 0;

# The name of the LaTeX program
# $latex = 'latex %O %S';

# Default switches to pass to the LaTeX program
# $latex_default_switches = '';

# The command line switch to make LaTeX run in silent mode
# $latex_silent_switch = '-interaction=batchmode';
# $latex_silent_switch = "-interaction=batchmode -c-style-errors";

# Whether to treat log files as binary (1) or text (0).  This is normally only
# necessary on Windows platforms with MikTeX, where some control characters are
# embedded in the log file.
# $log_file_binary = 0

# The program that prints PostScript files
# $lpr = 'lpr %O %S';

# The program that prints DVI files
# $lpr_dvi = 'NONE $lpr_dvi variable is not configured to allow printing of dvi files';

# The program that prints PDF files
# $lpr_pdf = 'NONE $lpr_pdf variable is not configured to allow printing of pdf files';

# Command to run make
# $make = 'make';

# The name of the makeindex program
# $makeindex = 'makeindex %O -o %D %S';

# The command line switch to make makeindex run in silent mode
# $makeindex_silent_switch = '-q';

# The maximum number of times latex will be invoked in an effort to fix up
# references.
# $max_repeat = 5;

# Set to 1 to give special treatment to Ctrl-c and Ctrl-Break in -pvc mode on
# Windows.  This is unnecessary on Unix platforms.
# $MSWin_fudge_break = 0;

# Where the pid is in the output of $pscmd; see the man page
# $pid_position = 1;

# Always make a PostScript file
# $postscript_mode = 0;

# The type of file to printout: 'dvi', 'none', 'pdf', or 'ps'
# $print_type = 'ps';

# If nonzero, print the document using lpr each time it is created
# $printout_mode = 0;

# Filter to run on newly created PostScript files
# $ps_filter = '';

# The command to invoke a PostScript previewer
# $ps_previewer = 'start gv %O %S';
# $ps_previewer = 'xdg-open %O %S';

# The command to invoke a PostScript previewer in landscape mode
# $ps_previewer_landscape = 'start gv -swap %O %S';
# $ps_previewer_landscape = 'xdg-open %O %S';

# The command to run when the PostScript viewer is set to be updated by a
# command
# $ps_update_command = '';

# How to make the PostScript viewer update its display when the PostScript
# file changes.  See the man page for a description of each method.
# $ps_update_method = 0;
# $ps_update_method = 1;

# When PostScript update method 2 is used, the number of the Unix signal to
# send
# $ps_update_signal = $signo{HUP}

# Command to convert a PostScript file to a PDF file
# $ps2pdf = 'ps2pdf %O %S %D';

# Command used to list all the processes currently run by the user
# $pscmd = "ps -f -u $ENV{USER}";

# Quote filenames in external commands.  This is essential for filenames
# containing spaces.
# $quote_filenames = 1;

# Whether to use the recorder option on (pdf)latex
# $recorder = 1;

# Whether to display lists of dependencies.
# $rules_list = 0;

# The character that separates paths in a list of paths
# $search_path_separator = ':';

# Whether to display timing information
# $show_time = 0;

# Whether to suppress latex messages
# $silent = 0;

# The time to sleep in seconds between checking for source file changes when
# running in continuous update mode
# $sleep_time = 2;

# Space-separated list of extra files to search for when no files are specified
# on the command line and the @default_files list is empty.  Wildcards are
# allowed.  These files are in addition to *.tex in the current directory.
# $texfile_search = "";

# Directories where BibTeX should look for .bib files.
# $TEXINPUTS = $ENV('TEXINPUTS') || '.'

# The directory to store temporary files; omit the trailing '/'
# $tmpdir = $ENV{TMPDIR} || '/tmp';

# Whether to use make to try to create missing files
# $use_make_for_missing_files = 0;

# Which kind of file is to be previewed if a previewer is used.  The possible
# values are 'default', 'dvi', 'ps', and 'pdf'.  The value of 'default' means
# that the PDF is viewed if it is generated, else PostScript is viewed if it is
# generated, else DVI is viewed.
# $view = 'default';

######################################################################
# # run makeglossaries if needed
# add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
# add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

# sub run_makeglossaries {
#   if ( $silent ) {
#     system "makeglossaries -q '$_[0]'";
#   }
#   else {
#     system "makeglossaries '$_[0]'";
#   };
# }

# push @generated_exts, 'glo', 'gls', 'glg';
# push @generated_exts, 'acn', 'acr', 'alg';
# push @generated_exts, 'slg', 'syg', 'syi';
# push @generated_exts, 'ist';
# push @generated_exts, 'pyg', 'tdo', 'lol';
#######################################################################

#######################################################################
# # Enables makeglossaries to work with subdirectory outputs
# add_cus_dep('glo', 'gls', 0, 'makeglossaries');
# sub makeglossaries {
#     my ($base_name, $path) = fileparse( $_[0] );
#     pushd $path;
#     my $return = system "makeglossaries $base_name";
#     popd;
#     return $return;
# }
######################################################################
