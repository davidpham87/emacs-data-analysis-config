;;; Compiled snippets and support files for `clojure-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'clojure-mode
                     '(("apl2" ";;; `(file-name-nondirectory (buffer-file-name (current-buffer)))` --- ${1:Short description.}\n;;\n;; Copyright ${2:`(nth 5 (decode-time))`} ${3:Google, Inc}.\n;;\n;; Licensed under the Apache License, Version 2.0 (the \"License\");\n;; you may not use this file except in compliance with the License.\n;; You may obtain a copy of the License at\n;;\n;;    http://www.apache.org/licenses/LICENSE-2.0\n;;\n;; Unless required by applicable law or agreed to in writing, software\n;; distributed under the License is distributed on an \"AS IS\" BASIS,\n;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n;; See the License for the specific language governing permissions and\n;; limitations under the License.\n;;\n;; Author: ${4:`user-mail-address`} (${5:`(user-full-name)`})\n\n;;; Commentary:\n;;\n;; $6\n\n;;; Code:\n;;\n\n$0\n\n\n;;; `(file-name-nondirectory (buffer-file-name (current-buffer)))` ends here\n" "apl2" nil nil nil nil nil nil)
                       ("arpegio" "(let [time (now)]\n  (at (+ 200 time) (piano 62))\n  (at (+ 400 time) (piano 66))\n  (at (+ 700 time) (piano 69))\n  (at (+ 800 time) (piano 72)))\n" "arpegio" nil nil nil nil nil nil)
                       ("bp" "(swank.core/break)" "bp" nil nil nil nil nil nil)
                       ("c" "(comment\n  $0\n  )" "comment" nil nil nil nil nil nil)
                       ("chord-prog" "\n(defn play [s notes]\n  (doseq [n notes]\n    (s n)))\n\n(let [time (now)]\n  (at time (play sampled-piano (chord :D3 :major7)))\n  (at (+ 2000 time) (play sampled-piano (chord :A3 :major)))\n  (at (+ 3000 time) (play sampled-piano (chord :A3 :major7)))\n  (at (+ 4300 time) (play sampled-piano (chord :F3 :major7))))\n" "chord-prog" nil nil nil nil nil nil)
                       ("cond." "(cond\n  (> mark 90) \"top notch\"\n  (> mark 50) \"good\"\n  :else \"satisfactory\")\n" "Example cond" nil
                        ("examples")
                        nil nil nil nil)
                       ("condp" "(condp ${1:pred} ${2:expr}\n  $0)" "condp" nil nil nil nil nil nil)
                       ("defm" "(defmethod ${1:name} ${2:match}\n  [${3:args}]\n  $0)" "defmethod" nil nil nil nil nil nil)
                       ("defmm" "(defmulti ${1:name} ${2:dispatch-fn})" "defmulti" nil nil nil nil nil nil)
                       ("defn" "(defn ${1:name} ${2:\n  \"${3:doc-string}\"\n  }[${4:arg-list}]\n  $0)\n" "defn" nil nil nil nil nil nil)
                       ("defp" "(defprotocol ${1:Name}\n  $0)" "defprotocol" nil nil nil nil nil nil)
                       ("defr" "(defrecord ${1:Name} [${2:fields}]\n  ${3:Protocol}\n  $0)" "defrecord" nil nil nil nil nil nil)
                       ("deft" "(deftype ${1:Name} [${2:fields}]\n  ${3:Protocol}\n  $0)" "deftype" nil nil nil nil nil nil)
                       ("don" "(doseq [i (range (count ${1:times}))]\n  ${2:body-expr})" "do seq n times" nil nil nil nil nil nil)
                       ("dubstep" "(defsynth dubstep [bpm 120 wobble 1 note 50 snare-vol 1 kick-vol 1 v 1 out-bus 0]\n (let [trig (impulse:kr (/ bpm 120))\n       freq (midicps note)\n       swr (demand trig 0 (dseq [wobble] INF))\n       sweep (lin-exp (lf-tri swr) -1 1 40 3000)\n       wob (apply + (saw (* freq [0.99 1.01])))\n       wob (lpf wob sweep)\n       wob (* 0.8 (normalizer wob))\n       wob (+ wob (bpf wob 1500 2))\n       wob (+ wob (* 0.2 (g-verb wob 9 0.7 0.7)))\n\n       kickenv (decay (t2a (demand (impulse:kr (/ bpm 30)) 0 (dseq [1 0 0 0 0 0 1 0 1 0 0 1 0 0 0 0] INF))) 0.7)\n       kick (* (* kickenv 7) (sin-osc (+ 40 (* kickenv kickenv kickenv 200))))\n       kick (clip2 kick 1)\n\n       snare (* 3 (pink-noise) (apply + (* (decay (impulse (/ bpm 240) 0.5) [0.4 2]) [1 0.05])))\n       snare (+ snare (bpf (* 4 snare) 2000))\n       snare (clip2 snare 1)]\n\n   (out out-bus    (* v (clip2 (+ wob (* kick-vol kick) (* snare-vol snare)) 1)))))\n" "dubstep" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        nil nil nil)
                       ("fn" "(fn [${1:arg-list}] $0)" "fn" nil nil nil nil nil nil)
                       ("for" "(for [${1:seq-exprs}]\n  ${2:body-expr})" "for" nil nil nil nil nil nil)
                       ("freesounds" "(def dirty-kick (freesound 30669))\n(def ring-hat (freesound 12912))\n(def snare (freesound 26903))\n(def click (freesound 406))\n(def wop (freesound 85291))\n(def subby (freesound 25649))\n" "freesounds" nil nil nil nil nil nil)
                       ("goog" ";;; `(file-name-nondirectory (buffer-file-name (current-buffer)))` --- ${1:Short description.}\n;;\n;; Copyright ${2:`(nth 5 (decode-time))`} ${3:Google, Inc}.\n;; All Rights Reserved.\n;;\n;; Author: ${4:`user-mail-address`} (${5:`(user-full-name)`})\n\n;;; Commentary:\n;;\n;; $6\n\n;;; Code:\n;;\n\n$0\n\n\n;;; `(file-name-nondirectory (buffer-file-name (current-buffer)))` ends here\n" "goog" nil nil nil nil nil nil)
                       ("hickey" "(do\n  (defonce hickey-he-man (sample \"~/Dropbox/jon-n-sam/audio-files/hickey-he-man.wav\"))\n  (defonce hickey-no-to-complexity (sample \"~/Dropbox/jon-n-sam/audio-files/hickey-no-to-complexity.wav\")))\n" "hickey" nil nil nil nil nil nil)
                       ("if" "(if ${1:test-expr}\n  ${2:then-expr}\n  ${3:else-expr})" "if" nil nil nil nil nil nil)
                       ("import" "(:import [${1:package}])" "import" nil nil nil nil nil nil)
                       ("inst" "(definst ${1:inst-name} [${2:arg list}]\n  (let [$0]))\n" "inst" nil nil nil nil nil nil)
                       ("kwargs" "& {:keys [${1:keys}] :or {${2:defaults}}}" "keyword args" nil nil nil nil nil nil)
                       ("let" "(let [$0])" "let" nil nil nil nil nil nil)
                       ("letfn" "(letfn [(${1:name) [${2:args}]\n          $0)])" "letfn" nil nil nil nil nil nil)
                       ("m" "(${1:name} [${2:this} ${3:args}]\n  $0)" "method" nil nil nil nil nil nil)
                       ("ns" "(ns `(let* ((nsname '())\n        (dirs (split-string (buffer-file-name) \"/\"))\n        (aftersrc nil))\n     (dolist (dir dirs)\n        (if aftersrc\n            (progn\n                (setq nsname (cons dir nsname))\n                (setq nsname (cons \".\" nsname)))\n             (when (or (string= dir \"src\") (string= dir \"test\"))\n                (setq aftersrc t))))\n     (when nsname\n       (replace-regexp-in-string \"_\" \"-\" (substring (apply 'concat (reverse nsname))  0 -5))))`\n     \"${1:Short package description.}\"$0)\n" "ns" nil nil nil nil nil nil)
                       ("ns1" "(ns ${1:name}\n  $0)" "ns" nil nil nil nil nil nil)
                       ("nso" "(ns ${1:name}\n  (:use clojure.stacktrace\n        midi osc byte-spec\n        [overtone config time-utils log event]\n        [overtone.helpers chance scaling]\n        [overtone.sc.ugen constants]\n        [overtone.sc allocator core ugen node synth synthdef cgen\n         trigger buffer envelope bus sample sc-lang example]\n        [overtone.sc.cgen audio-in oscillators demand]\n        [overtone.sc.examples demand osc trig compander audio-in]\n        [overtone.music rhythm pitch tuning]\n        [overtone.studio core util fx]\n        [overtone.viz scope]\n        [overtone.inst piano io drum synth]\n        clojure.repl\n        clojure.pprint))\n\n(boot)\n\n$0\n" "ns" nil nil nil nil nil nil)
                       ("perc-env" "(env-gen (perc ${1:0.01} ${2:1.0}) :action FREE)$0\n" "perc-env" nil nil nil nil nil nil)
                       ("perf" "(dotimes [_ 10]\n  (time\n    (dotimes [_ ${1:times}] \n      $0)))" "perf" nil nil nil nil nil nil)
                       ("plucked-string" "(definst plucked-string [note 60 amp 0.8 dur 2 decay 30 coef 0.3 gate 1]\n  (let [freq   (midicps note)\n        noize  (* 0.8 (white-noise))\n        dly    (/ 1.0 freq)\n        plk    (pluck noize gate dly dly decay coef)\n        dist   (distort plk)\n        filt   (rlpf dist (* 12 freq) 0.6)\n        clp    (clip2 filt 0.8)\n        reverb (free-verb clp 0.4 0.8 0.2)]\n    (* amp (env-gen (perc 0.0001 dur) :action FREE) reverb)))\n" "plucked-string" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        nil nil nil)
                       ("pm" "(${1:name} [${2:this} ${3:args}])" "protocol method" nil nil nil nil nil nil)
                       ("reduce." "(reduce (fn [res el] (+ res el)) 0 [1 2 3 4 5])$0\n" "Example reduce" nil
                        ("examples")
                        nil nil nil nil)
                       ("refer" "(:refer-clojure :exclude [$0])" "refer" nil nil nil nil nil nil)
                       ("reich" "[:vi :vii :i+ :_ :vii :_ :i+ :vii :vi :_ :vii :_]$0" "reich" nil nil nil nil nil nil)
                       ("reich-score" ";; ___|)_______________|\\________________|\\______________|\\_______________|\\________\n;;|___/___||___________|_________________|_______________|________________|_________||\n;;|__/|___||.________,-.___( )___o-;___,-.___o-;__( )__,-.________o-; __,-.___o-;__.||\n;;|_/(|,\\_||.___(_)__\\`-'___|______/____\\`-'____/___|____\\`-'___(_)___/____\\`-'____/___.||\n;;|_\\_|_/_||____|__________|______________________|__________|______________________||\n;;    |         |          |/                     |/         |\n;;  (_|         |/                                           |/\n" "reich-score" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        nil nil nil)
                       ("require" "(:require [${1:namespace} :as [$0]])" "require" nil nil nil nil nil nil)
                       ("samples" "(do\n  (defonce cymbal-scrape (freesound 195228))\n  (defonce spooky-wind (freesound 82384))\n  (defonce bendy-guitar (freesound 87985))\n  (defonce train-leaving (freesound 125211))\n  (defonce drone1 (freesound 52139))\n  (defonce drone2 (freesound 53407))\n  (defonce drone3 (freesound 53406))\n  (defonce drone4 (freesound 53405))\n  (defonce drone5 (freesound 169013)))\n" "samples" nil nil nil nil nil nil)
                       ("sketch" "(defn setup []\n  (background 20)\n  (smooth))\n\n(defn draw [])\n\n(defsketch ${1:sketch-name}\n  :title \"${2:My Beautiful Sketch}\"\n  :setup setup\n  :draw draw\n  :size [${3:500 300}]\n  :renderer :${4:opengl}\n  $5:features [:keep-on-top])$0\n" "sketch" nil nil nil nil nil nil)
                       ("space-organ" "(defsynth space-organ []\n  (let [f     (map #(midicps (duty:kr % 0 (dseq [24 27 31 36 41] INF)))\n                   [1 1/2 1/4])\n        tones (map #(blip (* % %2) (mul-add:kr (lf-noise1:kr 1/4) 3 4))\n                   f\n                   [1 4 8])]\n    (out 0 (g-verb (sum tones) 200 8))))\n" "space-organ" nil nil
                        ((yas/indent-line 'fixed)
                         (yas/wrap-around-region 'nil))
                        nil nil nil)
                       ("use" "(:use [${1:namespace} :only [$0]])" "use" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Sun Nov  1 12:53:28 2015
