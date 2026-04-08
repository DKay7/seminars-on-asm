
stack-aligment:     file format elf32-i386


Disassembly of section .init:

00001000 <_init>:
    1000:	53                   	push   ebx
    1001:	83 ec 08             	sub    esp,0x8
    1004:	e8 37 01 00 00       	call   1140 <__x86.get_pc_thunk.bx>
    1009:	81 c3 eb 2f 00 00    	add    ebx,0x2feb
    100f:	8b 83 f4 ff ff ff    	mov    eax,DWORD PTR [ebx-0xc]
    1015:	85 c0                	test   eax,eax
    1017:	74 02                	je     101b <_init+0x1b>
    1019:	ff d0                	call   eax
    101b:	83 c4 08             	add    esp,0x8
    101e:	5b                   	pop    ebx
    101f:	c3                   	ret

Disassembly of section .plt:

00001020 <__libc_start_main@plt-0x10>:
    1020:	ff b3 04 00 00 00    	push   DWORD PTR [ebx+0x4]
    1026:	ff a3 08 00 00 00    	jmp    DWORD PTR [ebx+0x8]
    102c:	00 00                	add    BYTE PTR [eax],al
	...

00001030 <__libc_start_main@plt>:
    1030:	ff a3 0c 00 00 00    	jmp    DWORD PTR [ebx+0xc]
    1036:	68 00 00 00 00       	push   0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

00001040 <printf@plt>:
    1040:	ff a3 10 00 00 00    	jmp    DWORD PTR [ebx+0x10]
    1046:	68 08 00 00 00       	push   0x8
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

00001050 <__cxa_finalize@plt>:
    1050:	ff a3 f0 ff ff ff    	jmp    DWORD PTR [ebx-0x10]
    1056:	66 90                	xchg   ax,ax

Disassembly of section .text:

00001060 <set_fast_math_sse>:
    1060:	55                   	push   ebp
    1061:	89 e5                	mov    ebp,esp
    1063:	83 e4 f0             	and    esp,0xfffffff0
    1066:	81 ec 10 02 00 00    	sub    esp,0x210
    106c:	f7 45 08 00 00 00 01 	test   DWORD PTR [ebp+0x8],0x1000000
    1073:	74 27                	je     109c <set_fast_math_sse+0x3c>
    1075:	31 c0                	xor    eax,eax
    1077:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
    107b:	0f ae 44 24 10       	fxsave [esp+0x10]
    1080:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
    1084:	f6 44 24 2c 40       	test   BYTE PTR [esp+0x2c],0x40
    1089:	74 03                	je     108e <set_fast_math_sse+0x2e>
    108b:	83 c8 40             	or     eax,0x40
    108e:	80 cc 80             	or     ah,0x80
    1091:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
    1095:	0f ae 54 24 0c       	ldmxcsr DWORD PTR [esp+0xc]
    109a:	c9                   	leave
    109b:	c3                   	ret
    109c:	0f ae 5c 24 0c       	stmxcsr DWORD PTR [esp+0xc]
    10a1:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
    10a5:	eb e7                	jmp    108e <set_fast_math_sse+0x2e>
    10a7:	2e 8d b4 26 00 00 00 	lea    esi,cs:[esi+eiz*1+0x0]
    10ae:	00 
    10af:	90                   	nop

000010b0 <set_fast_math>:
    10b0:	f3 0f 1e fb          	endbr32
    10b4:	9c                   	pushf
    10b5:	9c                   	pushf
    10b6:	58                   	pop    eax
    10b7:	89 c2                	mov    edx,eax
    10b9:	35 00 00 20 00       	xor    eax,0x200000
    10be:	50                   	push   eax
    10bf:	9d                   	popf
    10c0:	9c                   	pushf
    10c1:	58                   	pop    eax
    10c2:	9d                   	popf
    10c3:	31 d0                	xor    eax,edx
    10c5:	a9 00 00 20 00       	test   eax,0x200000
    10ca:	74 37                	je     1103 <set_fast_math+0x53>
    10cc:	55                   	push   ebp
    10cd:	89 e5                	mov    ebp,esp
    10cf:	56                   	push   esi
    10d0:	31 f6                	xor    esi,esi
    10d2:	53                   	push   ebx
    10d3:	89 f0                	mov    eax,esi
    10d5:	0f a2                	cpuid
    10d7:	85 c0                	test   eax,eax
    10d9:	74 13                	je     10ee <set_fast_math+0x3e>
    10db:	b8 01 00 00 00       	mov    eax,0x1
    10e0:	89 f3                	mov    ebx,esi
    10e2:	89 f1                	mov    ecx,esi
    10e4:	0f a2                	cpuid
    10e6:	f7 c2 00 00 00 02    	test   edx,0x2000000
    10ec:	75 07                	jne    10f5 <set_fast_math+0x45>
    10ee:	8d 65 f8             	lea    esp,[ebp-0x8]
    10f1:	5b                   	pop    ebx
    10f2:	5e                   	pop    esi
    10f3:	5d                   	pop    ebp
    10f4:	c3                   	ret
    10f5:	83 ec 0c             	sub    esp,0xc
    10f8:	52                   	push   edx
    10f9:	e8 62 ff ff ff       	call   1060 <set_fast_math_sse>
    10fe:	83 c4 10             	add    esp,0x10
    1101:	eb eb                	jmp    10ee <set_fast_math+0x3e>
    1103:	c3                   	ret
    1104:	66 90                	xchg   ax,ax
    1106:	66 90                	xchg   ax,ax
    1108:	66 90                	xchg   ax,ax
    110a:	66 90                	xchg   ax,ax
    110c:	66 90                	xchg   ax,ax
    110e:	66 90                	xchg   ax,ax

00001110 <_start>:
    1110:	31 ed                	xor    ebp,ebp
    1112:	5e                   	pop    esi
    1113:	89 e1                	mov    ecx,esp
    1115:	83 e4 f0             	and    esp,0xfffffff0
    1118:	50                   	push   eax
    1119:	54                   	push   esp
    111a:	52                   	push   edx
    111b:	e8 18 00 00 00       	call   1138 <_start+0x28>
    1120:	81 c3 d4 2e 00 00    	add    ebx,0x2ed4
    1126:	6a 00                	push   0x0
    1128:	6a 00                	push   0x0
    112a:	51                   	push   ecx
    112b:	56                   	push   esi
    112c:	ff b3 f8 ff ff ff    	push   DWORD PTR [ebx-0x8]
    1132:	e8 f9 fe ff ff       	call   1030 <__libc_start_main@plt>
    1137:	f4                   	hlt
    1138:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
    113b:	c3                   	ret
    113c:	66 90                	xchg   ax,ax
    113e:	66 90                	xchg   ax,ax

00001140 <__x86.get_pc_thunk.bx>:
    1140:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
    1143:	c3                   	ret
    1144:	66 90                	xchg   ax,ax
    1146:	66 90                	xchg   ax,ax
    1148:	66 90                	xchg   ax,ax
    114a:	66 90                	xchg   ax,ax
    114c:	66 90                	xchg   ax,ax
    114e:	66 90                	xchg   ax,ax

00001150 <deregister_tm_clones>:
    1150:	e8 e4 00 00 00       	call   1239 <__x86.get_pc_thunk.dx>
    1155:	81 c2 9f 2e 00 00    	add    edx,0x2e9f
    115b:	8d 8a 28 00 00 00    	lea    ecx,[edx+0x28]
    1161:	8d 82 28 00 00 00    	lea    eax,[edx+0x28]
    1167:	39 c8                	cmp    eax,ecx
    1169:	74 1d                	je     1188 <deregister_tm_clones+0x38>
    116b:	8b 82 ec ff ff ff    	mov    eax,DWORD PTR [edx-0x14]
    1171:	85 c0                	test   eax,eax
    1173:	74 13                	je     1188 <deregister_tm_clones+0x38>
    1175:	55                   	push   ebp
    1176:	89 e5                	mov    ebp,esp
    1178:	83 ec 14             	sub    esp,0x14
    117b:	51                   	push   ecx
    117c:	ff d0                	call   eax
    117e:	83 c4 10             	add    esp,0x10
    1181:	c9                   	leave
    1182:	c3                   	ret
    1183:	2e 8d 74 26 00       	lea    esi,cs:[esi+eiz*1+0x0]
    1188:	c3                   	ret
    1189:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00001190 <register_tm_clones>:
    1190:	e8 a4 00 00 00       	call   1239 <__x86.get_pc_thunk.dx>
    1195:	81 c2 5f 2e 00 00    	add    edx,0x2e5f
    119b:	55                   	push   ebp
    119c:	89 e5                	mov    ebp,esp
    119e:	53                   	push   ebx
    119f:	8d 8a 28 00 00 00    	lea    ecx,[edx+0x28]
    11a5:	8d 82 28 00 00 00    	lea    eax,[edx+0x28]
    11ab:	83 ec 04             	sub    esp,0x4
    11ae:	29 c8                	sub    eax,ecx
    11b0:	89 c3                	mov    ebx,eax
    11b2:	c1 e8 1f             	shr    eax,0x1f
    11b5:	c1 fb 02             	sar    ebx,0x2
    11b8:	01 d8                	add    eax,ebx
    11ba:	d1 f8                	sar    eax,1
    11bc:	74 14                	je     11d2 <register_tm_clones+0x42>
    11be:	8b 92 fc ff ff ff    	mov    edx,DWORD PTR [edx-0x4]
    11c4:	85 d2                	test   edx,edx
    11c6:	74 0a                	je     11d2 <register_tm_clones+0x42>
    11c8:	83 ec 08             	sub    esp,0x8
    11cb:	50                   	push   eax
    11cc:	51                   	push   ecx
    11cd:	ff d2                	call   edx
    11cf:	83 c4 10             	add    esp,0x10
    11d2:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    11d5:	c9                   	leave
    11d6:	c3                   	ret
    11d7:	2e 8d b4 26 00 00 00 	lea    esi,cs:[esi+eiz*1+0x0]
    11de:	00 
    11df:	90                   	nop

000011e0 <__do_global_dtors_aux>:
    11e0:	f3 0f 1e fb          	endbr32
    11e4:	55                   	push   ebp
    11e5:	89 e5                	mov    ebp,esp
    11e7:	53                   	push   ebx
    11e8:	e8 53 ff ff ff       	call   1140 <__x86.get_pc_thunk.bx>
    11ed:	81 c3 07 2e 00 00    	add    ebx,0x2e07
    11f3:	83 ec 04             	sub    esp,0x4
    11f6:	80 bb 28 00 00 00 00 	cmp    BYTE PTR [ebx+0x28],0x0
    11fd:	75 27                	jne    1226 <__do_global_dtors_aux+0x46>
    11ff:	8b 83 f0 ff ff ff    	mov    eax,DWORD PTR [ebx-0x10]
    1205:	85 c0                	test   eax,eax
    1207:	74 11                	je     121a <__do_global_dtors_aux+0x3a>
    1209:	83 ec 0c             	sub    esp,0xc
    120c:	ff b3 18 00 00 00    	push   DWORD PTR [ebx+0x18]
    1212:	e8 39 fe ff ff       	call   1050 <__cxa_finalize@plt>
    1217:	83 c4 10             	add    esp,0x10
    121a:	e8 31 ff ff ff       	call   1150 <deregister_tm_clones>
    121f:	c6 83 28 00 00 00 01 	mov    BYTE PTR [ebx+0x28],0x1
    1226:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    1229:	c9                   	leave
    122a:	c3                   	ret
    122b:	2e 8d 74 26 00       	lea    esi,cs:[esi+eiz*1+0x0]

00001230 <frame_dummy>:
    1230:	f3 0f 1e fb          	endbr32
    1234:	e9 57 ff ff ff       	jmp    1190 <register_tm_clones>

00001239 <__x86.get_pc_thunk.dx>:
    1239:	8b 14 24             	mov    edx,DWORD PTR [esp]
    123c:	c3                   	ret
    123d:	66 90                	xchg   ax,ax
    123f:	90                   	nop

00001240 <main>:
    1240:	55                   	push   ebp
    1241:	89 e5                	mov    ebp,esp
    1243:	6a 7b                	push   0x7b
    1245:	68 10 40 00 00       	push   0x4010
    124a:	e8 fc ff ff ff       	call   124b <main+0xb>
    124f:	83 c4 08             	add    esp,0x8
    1252:	83 c4 04             	add    esp,0x4
    1255:	31 c0                	xor    eax,eax
    1257:	c9                   	leave
    1258:	c3                   	ret

Disassembly of section .fini:

0000125c <_fini>:
    125c:	53                   	push   ebx
    125d:	83 ec 08             	sub    esp,0x8
    1260:	e8 db fe ff ff       	call   1140 <__x86.get_pc_thunk.bx>
    1265:	81 c3 8f 2d 00 00    	add    ebx,0x2d8f
    126b:	83 c4 08             	add    esp,0x8
    126e:	5b                   	pop    ebx
    126f:	c3                   	ret
