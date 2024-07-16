SHELL = /bin/sh

include ../../../paths.sh

install:
	mkdir -p $(CGIDIR)/$(SCL_CGI)/MT/prog/interface 
	cp anu_help.html $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/ 
	cp about.html $(HTDOCSDIR)/$(SCL_HTDOCS)/MT/
	cp add_colorcode.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/interface
	cp display_output.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/interface
	cp get_anvaya_order_html.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/interface	
	cp get_anvaya_shloka_translation.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/interface
	cp modify_mo_*.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/interface
	cp print_table_bottom_menu.pl $(CGIDIR)/$(SCL_CGI)/MT/prog/interface
	cp show_graph.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/interface
	cp show_top_parses.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/interface
	cp show_selected_parse.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/interface
	cp call_parser_summary.cgi $(CGIDIR)/$(SCL_CGI)/MT/prog/interface
clean: 
	rm -f $(TARGETS)

