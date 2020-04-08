(define (problem house_build2)
  (:domain house_build_v2)

  (:objects 
moshe - person s1 - site h1 h2 - house br1 - bricks ba - balcony bath1 - bath to - toilet ca - carpet la - lamp tv1 - tv co - couch be - bed cl - closet w - windows c - cables fl - floortile pl - plants l - lawn fe - fence)
(:init 
    (at-site moshe)) 
(:goal (and 
    (is-regular-house h2)  (is-penthouse h1)))

)