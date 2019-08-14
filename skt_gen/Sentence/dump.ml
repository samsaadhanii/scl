value datapath = "/home/amba/scl/skt_gen/Sentence/data/";

value split2 str fmt =  Scanf.sscanf str fmt (fun x y -> (x,y))
;

value rec read_file chin acc fmt =
      try let line = input_line chin in
      let (a,b) = split2 line fmt in
      let acc = List.append acc [(a,b)] in
            read_file chin acc fmt
    with
    [ End_of_file -> do { close_in chin; acc}
    ]
;

value read_list file fmt =
let chin = open_in file in
 read_file chin [] fmt
;

value root_info_list =
      read_list (datapath ^ "dhatu_info_chart_uBaya_wx.txt") "%s %s"
;

(* value wif_info_list =
      read_list (datapath ^ "wif_gen.txt") "%s %s"
; *)

value main = do {
             let rt_lst = root_info_list in
             Gen.dump rt_lst (datapath ^ "dhatu_info_chart_uBaya_wx.rem")
             (* ; let wif_gen = wif_info_list in
             Gen.dump wif_gen (datapath ^ "wif_gen.rem") *)
             }
;
