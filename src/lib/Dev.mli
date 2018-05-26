type tm = Tm.tm
type ty = Tm.tm

type 'a decl =
  | Hole
  | Defn of 'a

type status =
  | Blocked
  | Active

type equation =
  {ty0 : ty; tm0 : tm; ty1 : ty; tm1 : ty}

type param =
  | P of ty
  | Tw of ty * ty

type params = (Name.t * param) list

type 'a bind

type problem =
  | Unify of equation
  | All of param * problem bind

type entry =
  | E of Name.t * ty * tm decl
  | Q of status * problem

val bind : Name.t -> problem -> problem bind
val unbind : problem bind -> Name.t * problem


type twin = [`Only | `TwinL | `TwinR]


module Prob :
sig
  val eqn : ty -> tm -> ty -> tm -> problem
  val all : Name.t -> ty -> problem -> problem
  val all_twins : Name.t -> ty -> ty -> problem -> problem
end