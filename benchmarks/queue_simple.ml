module Queue = Kcas_data.Queue

let () =
  print_endline "Queue simple benchmark";

  let queue = Queue.create () in

  let rec loop_enqueue i =
    match i with
    | 0 -> ()
    | _ ->
        Queue.push i queue;
        loop_enqueue (i - 1)
  in

  let rec loop_dequeue i =
    match i with
    | 0 -> ()
    | _ ->
        let _ = Queue.take queue in
        loop_dequeue (i - 1)
  in

  let _ = loop_enqueue 100000 in
  let _ = loop_dequeue 100000 in
  ()
