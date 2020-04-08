(define 
    (domain house_build_v2)
(:requirements
    :adl
    :fluents
    :conditional-effects
    :equality
    ; :duration-inequalities
)

;;;;;; הערות למחר - לנסות להוסיף "מחיר" לפעולות

(:typ   es 
    material house person - object
    bricks floortile cables windows balcony garden bathroomM bedroomM livingroomM - material
    plants fence lawn - garden
    bath toilet carpet - bathroomM
    lamp bed closet - bedroomM
    tv couch lamp - livingroomM
    site
)

(:predicates 
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; build house ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (walls-built ?h - house)
    (windows-fitted ?h - house)
    (floor-built ?h - house)
    (ceiling-built ?h - house)
    (have-fundamental ?h - house)
    (house-build ?h - house)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; material ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (have ?p - person ?m - material)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; garden ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (have-plants ?h - house)
    (have-fence ?h - house)
    (have-lawn ?h - house)
    (have-garden ?h - house)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; penthouse ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (have-balcony ?h - house)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; site-actions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (foundations-set ?s - site)
    (have-building ?s - site)
    (finish-building ?s - site)
    (cable-building ?s - site)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; room ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (have-living-room ?h - house)
    (have-bath-room ?h - house)
    (have-bed-room ?h - house)
    (have-rooms ?h - house)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; house-type ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (is-garden-house ?h - house)
    (is-penthouse ?h - house)
    (is-regular-house ?h - house)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; shop-type ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (at-workshop ?p - person)
    (at-wallmart ?p - person)
    (at-site ?p - person)
    (at-ikea ?p - person)
    (at-nursery ?p - person)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; house-upgrade ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
)

(:functions
    ; (total-cost)
    (number-of-house)
    (amount ?p - person ?m - material)
    (material-needed-wall ?m - material)
)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; go-to-shops ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    (:action GO-TO-WORKSHOP
        :parameters (?p - person)
        :precondition (and 
            (not (at-workshop ?p))
        )
        :effect (and 
            (at-workshop ?p)
            ; (increase (total-cost) 1)
            (not (at-ikea ?p)) (not (at-wallmart ?p)) (not (at-nursery ?p)) (not (at-site ?p))
        )
    )

    (:action GO-TO-IKEA
        :parameters (?p - person)
        :precondition (and 
            (not (at-ikea ?p))
        )
        :effect (and 
            (at-ikea ?p)
            ; (increase (total-cost) 1)
            (not (at-workshop ?p)) (not (at-wallmart ?p)) (not (at-nursery ?p)) (not (at-site ?p))
        )
    )

    (:action GO-TO-WALMART
        :parameters (?p - person)
        :precondition (and 
            (not (at-wallmart ?p))
        )
        :effect (and 
            (at-wallmart ?p)
            ; (increase (total-cost) 1)
            (not (at-workshop ?p)) (not (at-ikea ?p)) (not (at-nursery ?p)) (not (at-site ?p))
        )
    )

    (:action GO-TO-NURSERY
        :parameters (?p - person)
        :precondition (and 
            (not (at-nursery ?p))
        )
        :effect (and 
            (at-nursery ?p)
            ; (increase (total-cost) 1)
            (not (at-workshop ?p)) (not (at-ikea ?p)) (not (at-wallmart ?p)) (not (at-site ?p))
        )
    )
    
    
    (:action GO-TO-SITE
        :parameters (?p - person)
        :precondition (and 
            (not (at-site ?p))
        )
        :effect (and 
            (at-site ?p)
            (not (at-workshop ?p)) (not (at-ikea ?p)) (not (at-wallmart ?p)) (not (at-nursery ?p))
        )
    )

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; buy-material ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    (:action BUY-MATERIAL-WORKSHOP
        :parameters (?p - person
        ?br - bricks ?fl - floortile ?c - cables
        ?wi - windows ?ba - balcony ?fe - fence
        ?l - lamp)
        :precondition (and 
            (at-workshop ?p)
        )
        :effect (and 
        ; (increase (amount ?p ?br) 100)
        ; (increase (amount ?p ?fl) 50)
        ; (increase (amount ?p ?wi) 4)
        ; (increase (amount ?p ?ba) 1)
        ; (increase (amount ?p ?c) 30)
        ; (increase (amount ?p ?fe) 3)
            (have ?p ?br) (have ?p ?fl) (have ?p ?wi) 
            (have ?p ?ba) (have ?p ?c) (have ?p ?fe)
            (have ?p ?l)
        )
    )
    
    (:action BUY-MATERIAL-IKEA
        :parameters (?p - person
        ?cl - closet ?be - bed ?co - couch
        ?la - lamp ?to - toilet ?ba - bath
        ?br - bricks ?wi - windows)
        :precondition (and 
            (at-ikea ?p)
        )
        :effect (and 
        ; (increase (amount ?p ?cl) 2)
        ; (increase (amount ?p ?be) 1)
        ; (increase (amount ?p ?co) 1)
        ; (increase (amount ?p ?la) 4)
        ; (increase (amount ?p ?to) 1)
        ; (increase (amount ?p ?ba) 1)
            (have ?p ?cl) (have ?p ?be) (have ?p ?co) 
            (have ?p ?la) (have ?p ?to) (have ?p ?ba)
            (have ?p ?br) (have ?p ?wi)
        )
    )

    (:action BUY-MATERIAL-WALMART
        :parameters (?p - person
        ?tv - tv ?ca - carpet ?l - lamp)
        :precondition (and 
            (at-wallmart ?p)
        )
        :effect (and  
        ; (increase (amount ?p ?tv) 1)
        ; (increase (amount ?p ?ca) 1)
            (have ?p ?tv) (have ?p ?ca) 
            (have ?p ?l)
        )
    )

    (:action BUY-MATERIAL-NURSERY
        :parameters (?p - person
        ?pl - plants ?la - lawn)
        :precondition (and 
            (at-nursery ?p)
        )
        :effect (and 
        ; (increase (amount ?p ?pl) 12)
        ; (increase (amount ?p ?la) 1)
            (have ?p ?pl) (have ?p ?la)
        )
    )

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; build house fundamental ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    (:action BUILD-WALLS
        :parameters (?s - site ?h - house ?p - person ?b - bricks)
        :precondition (and 
            (at-site ?p)
            (have ?p ?b)
            (foundations-set ?s)
            (floor-built ?h)
            (not (walls-built ?h))
            
            ; (>= (amount ?p ?b) 30)
        )
        :effect (and
            (not (have ?p ?b))
            ; (decrease (amount ?p ?b) 30)
            (walls-built ?h)
        )
    )

    (:action INSTALL-WINDOWS
        :parameters (?s - site ?h - house ?p - person 
                    ?w - windows)
        :precondition (and 
            (at-site ?p)
            (have ?p ?w)
            (foundations-set ?s)
            (walls-built ?h)
            (not (windows-fitted ?h))
            ; (>= (amount ?p ?w) 3)
        )
        :effect (and 
            (windows-fitted ?h)
            (not (have ?p ?w))
            ; (decrease (amount ?p ?w) 3)
        )
    )

    (:action BUILD-FLOOR
        :parameters (?s - site ?h - house ?p - person ?f - floortile
                    ?b - bricks)
        :precondition (and 
            (at-site ?p)
            (have ?p ?f)
            (foundations-set ?s)
            (not (floor-built ?h))
            ; (>= (amount ?p ?f) 40)
            ; (>= (amount ?p ?b) 10)
        )
        :effect (and 
            (floor-built ?h)
            (not (have ?p ?f))
            ; (decrease (amount ?p ?f) 40)
            ; (decrease (amount ?p ?b) 10)
        )
    )

    (:action BUILD-CEILING
        :parameters (?s - site ?h - house ?p - person ?b - bricks)
        :precondition (and 
            (at-site ?p)
            (foundations-set ?s)
            (walls-built ?h)
            (floor-built ?h)
            (have ?p ?b)
            ; (>= (amount ?p ?b) 15)
        )
        :effect (and 
            (ceiling-built ?h)
            (not (have ?p ?b))
            ; (decrease (amount ?p ?b) 15)
        )
    )
    
    (:action CHECK-HOUSE-FUNDAMENTAL
        :parameters (?s -site ?h - house ?p - person)
        :precondition (and 
            (at-site ?p)
            (foundations-set ?s)
            (walls-built ?h)
            (windows-fitted ?h)
            (floor-built ?h)
            (ceiling-built ?h)
        )
        :effect (and 
            (have-fundamental ?h)
        )
    )

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; remove house fundamental ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    ; (:action REMOVE-WALL
    ;     :parameters (?s - site ?h - house ?p - person ?b - bricks)
    ;     :precondition (and 
    ;         (at-site ?p)
    ;         (not (have ?p ?b))
    ;         (walls-built ?h)
    ;     )
    ;     :effect (and
    ;         (have ?p ?b)
    ;         (not (walls-built ?h))
    ;     )
    ; )

    ; (:action UN-INSTALL-WINDOWS
    ;     :parameters (?s - site ?h - house ?p - person 
    ;                 ?w - windows)
    ;     :precondition (and 
    ;         (at-site ?p)
    ;         (not (have ?p ?w))
    ;         (windows-fitted ?h)
    ;     )
    ;     :effect (and 
    ;         (not (windows-fitted ?h))
    ;         (have ?p ?w)
    ;     )
    ; )

    ; (:action REMOVE-FLOOR
    ;     :parameters (?s - site ?h - house ?p - person ?f - floortile)
    ;     :precondition (and 
    ;         (at-site ?p)
    ;         (not (have ?p ?f))
    ;         (floor-built ?h)
    ;     )
    ;     :effect (and 
    ;         (not (floor-built ?h))
    ;         (have ?p ?f)
    ;     )
    ; )

    ; (:action REMOVE-CEILING
    ;     :parameters (?s - site ?h - house ?p - person ?b - bricks)
    ;     :precondition (and 
    ;         (at-site ?p)
    ;         (ceiling-built ?h)
    ;         (not (have ?p ?b))
    ;     )
    ;     :effect (and 
    ;         (not (ceiling-built ?h))
    ;         (have ?p ?b)
    ;     )
    ; )


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; house-rooms ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    (:action BUILD-BATH-ROOM
        :parameters (
            ?s - site ?h - house ?p - person ?ba - bath ?to - toilet ?ca - carpet
        )
        :precondition (and 
            (at-site ?p)(foundations-set ?s)(have-fundamental ?h)(have ?p ?ba)(have ?p ?to)(have ?p ?ca)
        )
        :effect (and 
            (have-bath-room ?h)(not (have ?p ?ba)) (not (have ?p ?to))(not (have ?p ?ca))
        )
    )

    (:action BUILD-BED-ROOM
        :parameters (
            ?s - site ?h - house ?p - person 
            ?la - lamp ?be - bed ?cl - closet
        )
        :precondition (and 
            (at-site ?p)
            (foundations-set ?s)
            (have-fundamental ?h)
            ; (>= (amount ?p ?la) 2)
            ; (>= (amount ?p ?be) 1)
            ; (>= (amount ?p ?cl) 1)
            (have ?p ?la)
            (have ?p ?be)
            (have ?p ?cl)
        )
        :effect (and 
            (have-bed-room ?h)
            ; (decrease (amount ?p ?la) 2)
            ; (decrease (amount ?p ?be) 1)
            ; (decrease (amount ?p ?cl) 1)
            (not (have ?p ?la)) (not (have ?p ?be))
            (not (have ?p ?cl))
        )
    )

    (:action BUILD-LIVING-ROOM
        :parameters (
            ?s - site ?h - house ?p - person 
            ?la - lamp ?tv - tv ?co - couch
        )
        :precondition (and 
            (at-site ?p)
            (foundations-set ?s)
            (have-fundamental ?h)
            ; (>= (amount ?p ?la) 2)
            ; (>= (amount ?p ?tv) 1)
            ; (>= (amount ?p ?co) 1)
            (have ?p ?la)
            (have ?p ?tv)
            (have ?p ?co)
        )
        :effect (and 
            (have-living-room ?h)
            ; (decrease (amount ?p ?la) 2)
            ; (decrease (amount ?p ?tv) 1)
            ; (decrease (amount ?p ?co) 1)
            (not (have ?p ?la)) (not (have ?p ?tv))
            (not (have ?p ?co))
        )
    )
    
    

    (:action BUILD-ROOMS-TYPE-A
        :parameters (?s - site ?h - house)
        :precondition (and
            (have-balcony ?h)(have-bath-room ?h)(have-bed-room ?h)
        )
        :effect (and 
            (have-rooms ?h)
        )
    )

    (:action BUILD-ROOMS-TYPE-B
        :parameters (?s - site ?h - house)
        :precondition (and
            (have-living-room ?h)
            (have-bath-room ?h)
        )
        :effect (and 
            (have-rooms ?h)
        )
    )

    (:action BUILD-ROOMS-TYPE-C
        :parameters (?s - site ?h - house)
        :precondition (and
            (have-bath-room ?h)
            (have-bed-room ?h)
        )
        :effect (and 
            (have-rooms ?h)
        )
    )
    

    (:action BUILD-HOUSE
        :parameters (?s - site ?h - house ?p - person)
        :precondition (and
            (at-site ?p)
            (foundations-set ?s)
            (have-fundamental ?h)
            (have-rooms ?h)
            (not (house-build ?h))
            (not (is-regular-house ?h))
        )
        :effect (and
            (house-build ?h)
        )
    )
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; garden-actions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (:action PLANT-PLANTS
        :parameters (?s - site ?h - house ?p - person ?pl - plants)
        :precondition (and 
            (have ?p ?pl)(at-site ?p)(foundations-set ?s)(have-lawn ?h)(not (have-plants ?h))
            ; (not (material-used ?p))
        )
        :effect (and 
            (have-plants ?h)(not (have ?p ?pl))
        )
    )

    (:action BUILD-FENCE
        :parameters (?s - site ?h - house ?p - person ?fe - fence)
        :precondition (and 
            (have ?p ?fe)(at-site ?p)(foundations-set ?s)(not (have-fence ?h))
            ; (not (material-used ?f))
        )
        :effect (and 
            (have-fence ?h)(not (have ?p ?fe))
        )
    )
    
    (:action BUILD-LAWN
        :parameters (?s - site ?h - house ?p - person ?l - lawn)
        :precondition (and 
            (have ?p ?l)(at-site ?p)(foundations-set ?s)(not (have-lawn ?h))
        )
        :effect (and 
            (have-lawn ?h)
            ; (decrease (amount ?p ?l) 1)
            (not (have ?p ?l))
            ; (not (on-site ?l ?s))
        )
    )

    (:action BUILD-GARDEN
        :parameters (?h - house ?pl - plants ?l - lawn ?f - fence ?p - person)
        :precondition (and 
            (at-site ?p)(have-fence ?h)(have-lawn ?h)(have-plants ?h)(not (have-garden ?h))
        )
        :effect (and 
            (have-garden ?h)
        )
    )

    (:action SEAL-REGULAR-HOUSE
        :parameters (?s - site ?h - house ?p - person)
        :precondition (and
            (at-site ?p)
            (house-build ?h)
            (not (is-regular-house ?h))
            (not (is-penthouse ?h))
            (not (is-garden-house ?h))
        )
        :effect (and
            (is-regular-house ?h)
            ; (increase (number-of-house) 1)    
        )
    )

    (:action BUILD-BALCONY
        :parameters (?s - site ?h - house ?p - person ?b - balcony)
        :precondition (and 
            (at-site ?p)
            (house-build ?h)
            (have ?p ?b)
            (foundations-set ?s)
            (not (have-balcony ?h))
        )
        :effect (and 
            (have-balcony ?h)
            (not (have ?p ?b))
            ; (not (on-site ?b ?s))
        )
    )

    ;;;;;;;houses-type;;;;;;
    (:action BUILD-PENTHOUSE
        :parameters (?s - site ?h - house ?p - person)
        :precondition (and 
            (at-site ?p)(house-build ?h)(have-balcony ?h)(have-bath-room ?h)(have-bed-room ?h)(have-living-room ?h)(not (is-garden-house ?h))(not (is-regular-house ?h))
        )
        :effect (and 
            (is-penthouse ?h)(finish-building ?s)
        )
    )
    
    (:action BUILD-GARDENHOUSE
        :parameters (?s - site ?h - house ?p - person)
        :precondition (and 
            (at-site ?p)
            (have-garden ?h)
            (house-build ?h)
            (not (finish-building ?s))
            (not (is-regular-house ?h))
            (not (is-penthouse ?h))
        )
        :effect (and 
            (is-garden-house ?h)
            ; (increase (number-of-house) 1)
            ; (can-start-building ?s)
        )
    )

    ;;;;;;;site-actions;;;;;;
    (:action SET-FOUNDATIONS
        :parameters (?s - site ?p - person)
        :precondition (and 
            (at-site ?p)
        )
        :effect (and 
            (foundations-set ?s)
        )
    )
    
    (:action CABLE-BUILDING
        :parameters (?s - site ?p - person ?c - cables)
        :precondition (and 
            (at-site ?p)(finish-building ?s)(have ?p ?c)
        )
        :effect (and 
            (cable-building ?s)(not (have ?p ?c))
        )
    )
    

    ;;;;;;;goal-actions;;;;;;

    (:action BUILD-BUILDING-A
        :parameters (?s - site ?h1 - house ?h2 - house ?h3 - house ?p - person)
        :precondition (and 
            (at-site ?p)(is-garden-house ?h1) (is-penthouse ?h2) (is-regular-house ?h3)
        )
        :effect (and 
            (have-building ?s)
        )
    )
)