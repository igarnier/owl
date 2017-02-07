(*
 * OWL - an OCaml numerical library for scientific computing
 * Copyright (c) 2016-2017 Liang Wang <liang.wang@cl.cam.ac.uk>
 *)

(** Algorithmic differentiation - Forward mode *)

type dual

type t = Float of float | Dual of dual


(** {6 Derivative, Gradient, Jacobian, and Hessian} *)

val derivative : ?argnum:int -> (t array -> t) -> (t array -> t)

val gradient : (t array -> t) -> (t array -> t array)

val jacobian : (t array -> t array) -> (t array -> t array array)

val hessian : (t array -> t) -> (t array -> t array array)

val laplacian : (t array -> t) -> (t array -> t)


(** {6 Overloaded Mathematical Operators} *)

module Maths : sig

  val ( +. ) : t -> t -> t

  val ( -. ) : t -> t -> t

  val ( *. ) : t -> t -> t

  val ( /. ) : t -> t -> t

  val sin : t -> t

  val cos : t -> t

end


(** {6 Helper functions} *)

val degree : t -> int

val print_dual : t -> unit

val make_dual : t -> t -> t

val zero : t -> t

val one : t -> t
