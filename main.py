from pyswip import Prolog
import nltk
prolog = Prolog()
prolog.consult("khan_fam.pl")

def answer(func,text_list):
	text_list = ask.split(' ')
	for i in  range(len(text_list) -1):
		I = text_list[i]
		J = text_list[i+1]
		c = bool(list(prolog.query('{}(I,J)'.format(func))))
		d = list(prolog.query('{}(I,J)'.format(func)))
		for i in d:
			val = list(i.values())
			for k in text_list:
				if k == val[1] or k == val[0]	:
					return k,val
def preprocessing(text_list):
	text_list = ask.split(' ')
	key_list = []
	for i in range(len(text_list)):
		I = text_list[i]
		listi = dictionary.keys()
		for key in listi:
			if I in dictionary[key]:
				key_list.append(key)
	return key_list

dictionary = {'gins':["gins","gender","sex"], 'parent':["parents","parent","parnet","bare"], 'mianbiwi':["couples","couple","married","marry","love","relation"],
	      'beti':["beti","child","daughter","rehmat","girl","bairn","who"], 'beta':["beta","child","son","barkat","barkat","boy","who"], 'dada':["grandfather","daada","dada","bare","ancestor"],
	      'nana':["nana","naana","grand-father","grandfather","grandpa"], 'dadi':["dadi","grand-mother","daadi","grandma","grandmother"], 'nani':["naano","nani","naani","grandmother","mother'smother","grandma"],
	      'sala':["brother-in-law","wife's-bro"], 'bahu':["daughter-in-law","bahu","betiya","baahu"], 'pota':["grandson","grand-son","pota","son's-son"], 'poti':["poti","granddaughter","grand-daughter"],'susar':["susar","sussar","susssar","father-in-law","wife's-father","wifesfather"],
	      'chachataya':["uncle","bareuncle","bare-uncle"],'khala':["khala","khaala","aunt","auntie","aunti","mom-sis"],'baapdada':["baapdada","ancestors","bare"]}

outer_flag = True
print("all chat between you and chatbot will be in lower-case.")
while outer_flag:
	print()
	ask = str(input("Bot :- what's in your mind? \n"))
	inner_flag = True
	while inner_flag:
		key_list = preprocessing(ask)	
		for key in key_list:	
			for k in dictionary[key]:
				if k in ask:
					ans=answer(key,ask)
					if ans is None:
						print("Looking for it.......")
					else:
						print("Bot :- {} relation belongs with".format(key),(ans[1])[0],"and",(ans[1])[1])
						inner_flag = False