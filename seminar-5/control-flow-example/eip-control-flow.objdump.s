
./eip-control-flow:     file format elf32-i386


Disassembly of section .init:

08049000 <_init>:
 8049000:	53                   	push   ebx
 8049001:	83 ec 08             	sub    esp,0x8
 8049004:	e8 07 01 00 00       	call   8049110 <__x86.get_pc_thunk.bx>
 8049009:	81 c3 eb 2f 00 00    	add    ebx,0x2feb
 804900f:	8b 83 fc ff ff ff    	mov    eax,DWORD PTR [ebx-0x4]
 8049015:	85 c0                	test   eax,eax
 8049017:	74 02                	je     804901b <_init+0x1b>
 8049019:	ff d0                	call   eax
 804901b:	83 c4 08             	add    esp,0x8
 804901e:	5b                   	pop    ebx
 804901f:	c3                   	ret

Disassembly of section .plt:

08049020 <setbuf@plt-0x10>:
 8049020:	ff 35 f8 bf 04 08    	push   DWORD PTR ds:0x804bff8
 8049026:	ff 25 fc bf 04 08    	jmp    DWORD PTR ds:0x804bffc
 804902c:	00 00                	add    BYTE PTR [eax],al
	...

08049030 <setbuf@plt>:
 8049030:	ff 25 00 c0 04 08    	jmp    DWORD PTR ds:0x804c000
 8049036:	68 00 00 00 00       	push   0x0
 804903b:	e9 e0 ff ff ff       	jmp    8049020 <_init+0x20>

08049040 <__libc_start_main@plt>:
 8049040:	ff 25 04 c0 04 08    	jmp    DWORD PTR ds:0x804c004
 8049046:	68 08 00 00 00       	push   0x8
 804904b:	e9 d0 ff ff ff       	jmp    8049020 <_init+0x20>

08049050 <printf@plt>:
 8049050:	ff 25 08 c0 04 08    	jmp    DWORD PTR ds:0x804c008
 8049056:	68 10 00 00 00       	push   0x10
 804905b:	e9 c0 ff ff ff       	jmp    8049020 <_init+0x20>

08049060 <getchar@plt>:
 8049060:	ff 25 0c c0 04 08    	jmp    DWORD PTR ds:0x804c00c
 8049066:	68 18 00 00 00       	push   0x18
 804906b:	e9 b0 ff ff ff       	jmp    8049020 <_init+0x20>

08049070 <fgets@plt>:
 8049070:	ff 25 10 c0 04 08    	jmp    DWORD PTR ds:0x804c010
 8049076:	68 20 00 00 00       	push   0x20
 804907b:	e9 a0 ff ff ff       	jmp    8049020 <_init+0x20>

08049080 <__stack_chk_fail@plt>:
 8049080:	ff 25 14 c0 04 08    	jmp    DWORD PTR ds:0x804c014
 8049086:	68 28 00 00 00       	push   0x28
 804908b:	e9 90 ff ff ff       	jmp    8049020 <_init+0x20>

08049090 <putchar@plt>:
 8049090:	ff 25 18 c0 04 08    	jmp    DWORD PTR ds:0x804c018
 8049096:	68 30 00 00 00       	push   0x30
 804909b:	e9 80 ff ff ff       	jmp    8049020 <_init+0x20>

080490a0 <__isoc99_scanf@plt>:
 80490a0:	ff 25 1c c0 04 08    	jmp    DWORD PTR ds:0x804c01c
 80490a6:	68 38 00 00 00       	push   0x38
 80490ab:	e9 70 ff ff ff       	jmp    8049020 <_init+0x20>

080490b0 <fputs@plt>:
 80490b0:	ff 25 20 c0 04 08    	jmp    DWORD PTR ds:0x804c020
 80490b6:	68 40 00 00 00       	push   0x40
 80490bb:	e9 60 ff ff ff       	jmp    8049020 <_init+0x20>

Disassembly of section .text:

080490c0 <_start>:
 80490c0:	31 ed                	xor    ebp,ebp
 80490c2:	5e                   	pop    esi
 80490c3:	89 e1                	mov    ecx,esp
 80490c5:	83 e4 f0             	and    esp,0xfffffff0
 80490c8:	50                   	push   eax
 80490c9:	54                   	push   esp
 80490ca:	52                   	push   edx
 80490cb:	e8 19 00 00 00       	call   80490e9 <_start+0x29>
 80490d0:	81 c3 24 2f 00 00    	add    ebx,0x2f24
 80490d6:	6a 00                	push   0x0
 80490d8:	6a 00                	push   0x0
 80490da:	51                   	push   ecx
 80490db:	56                   	push   esi
 80490dc:	8d 83 f9 d0 ff ff    	lea    eax,[ebx-0x2f07]
 80490e2:	50                   	push   eax
 80490e3:	e8 58 ff ff ff       	call   8049040 <__libc_start_main@plt>
 80490e8:	f4                   	hlt
 80490e9:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 80490ec:	c3                   	ret

080490ed <__wrap_main>:
 80490ed:	e9 13 01 00 00       	jmp    8049205 <main>
 80490f2:	66 90                	xchg   ax,ax
 80490f4:	66 90                	xchg   ax,ax
 80490f6:	66 90                	xchg   ax,ax
 80490f8:	66 90                	xchg   ax,ax
 80490fa:	66 90                	xchg   ax,ax
 80490fc:	66 90                	xchg   ax,ax
 80490fe:	66 90                	xchg   ax,ax

08049100 <_dl_relocate_static_pie>:
 8049100:	c3                   	ret
 8049101:	66 90                	xchg   ax,ax
 8049103:	66 90                	xchg   ax,ax
 8049105:	66 90                	xchg   ax,ax
 8049107:	66 90                	xchg   ax,ax
 8049109:	66 90                	xchg   ax,ax
 804910b:	66 90                	xchg   ax,ax
 804910d:	66 90                	xchg   ax,ax
 804910f:	90                   	nop

08049110 <__x86.get_pc_thunk.bx>:
 8049110:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 8049113:	c3                   	ret
 8049114:	66 90                	xchg   ax,ax
 8049116:	66 90                	xchg   ax,ax
 8049118:	66 90                	xchg   ax,ax
 804911a:	66 90                	xchg   ax,ax
 804911c:	66 90                	xchg   ax,ax
 804911e:	66 90                	xchg   ax,ax

08049120 <deregister_tm_clones>:
 8049120:	b8 44 c0 04 08       	mov    eax,0x804c044
 8049125:	3d 44 c0 04 08       	cmp    eax,0x804c044
 804912a:	74 24                	je     8049150 <deregister_tm_clones+0x30>
 804912c:	b8 00 00 00 00       	mov    eax,0x0
 8049131:	85 c0                	test   eax,eax
 8049133:	74 1b                	je     8049150 <deregister_tm_clones+0x30>
 8049135:	55                   	push   ebp
 8049136:	89 e5                	mov    ebp,esp
 8049138:	83 ec 14             	sub    esp,0x14
 804913b:	68 44 c0 04 08       	push   0x804c044
 8049140:	ff d0                	call   eax
 8049142:	83 c4 10             	add    esp,0x10
 8049145:	c9                   	leave
 8049146:	c3                   	ret
 8049147:	2e 8d b4 26 00 00 00 	lea    esi,cs:[esi+eiz*1+0x0]
 804914e:	00 
 804914f:	90                   	nop
 8049150:	c3                   	ret
 8049151:	2e 8d b4 26 00 00 00 	lea    esi,cs:[esi+eiz*1+0x0]
 8049158:	00 
 8049159:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

08049160 <register_tm_clones>:
 8049160:	b8 44 c0 04 08       	mov    eax,0x804c044
 8049165:	2d 44 c0 04 08       	sub    eax,0x804c044
 804916a:	89 c2                	mov    edx,eax
 804916c:	c1 e8 1f             	shr    eax,0x1f
 804916f:	c1 fa 02             	sar    edx,0x2
 8049172:	01 d0                	add    eax,edx
 8049174:	d1 f8                	sar    eax,1
 8049176:	74 20                	je     8049198 <register_tm_clones+0x38>
 8049178:	ba 00 00 00 00       	mov    edx,0x0
 804917d:	85 d2                	test   edx,edx
 804917f:	74 17                	je     8049198 <register_tm_clones+0x38>
 8049181:	55                   	push   ebp
 8049182:	89 e5                	mov    ebp,esp
 8049184:	83 ec 10             	sub    esp,0x10
 8049187:	50                   	push   eax
 8049188:	68 44 c0 04 08       	push   0x804c044
 804918d:	ff d2                	call   edx
 804918f:	83 c4 10             	add    esp,0x10
 8049192:	c9                   	leave
 8049193:	c3                   	ret
 8049194:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8049198:	c3                   	ret
 8049199:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

080491a0 <__do_global_dtors_aux>:
 80491a0:	f3 0f 1e fb          	endbr32
 80491a4:	80 3d 68 c0 04 08 00 	cmp    BYTE PTR ds:0x804c068,0x0
 80491ab:	75 1b                	jne    80491c8 <__do_global_dtors_aux+0x28>
 80491ad:	55                   	push   ebp
 80491ae:	89 e5                	mov    ebp,esp
 80491b0:	83 ec 08             	sub    esp,0x8
 80491b3:	e8 68 ff ff ff       	call   8049120 <deregister_tm_clones>
 80491b8:	c6 05 68 c0 04 08 01 	mov    BYTE PTR ds:0x804c068,0x1
 80491bf:	c9                   	leave
 80491c0:	c3                   	ret
 80491c1:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
 80491c8:	c3                   	ret
 80491c9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

080491d0 <frame_dummy>:
 80491d0:	f3 0f 1e fb          	endbr32
 80491d4:	eb 8a                	jmp    8049160 <register_tm_clones>
 80491d6:	66 90                	xchg   ax,ax
 80491d8:	66 90                	xchg   ax,ax
 80491da:	66 90                	xchg   ax,ax
 80491dc:	66 90                	xchg   ax,ax
 80491de:	66 90                	xchg   ax,ax

080491e0 <dispatch_sign>:
 80491e0:	83 f8 00             	cmp    eax,0x0
 80491e3:	7c 10                	jl     80491f5 <dispatch_sign.neg>
 80491e5:	74 07                	je     80491ee <dispatch_sign.zero>

080491e7 <dispatch_sign.pos>:
 80491e7:	b8 3a c0 04 08       	mov    eax,0x804c03a
 80491ec:	eb 0c                	jmp    80491fa <print_msg>

080491ee <dispatch_sign.zero>:
 80491ee:	b8 35 c0 04 08       	mov    eax,0x804c035
 80491f3:	eb 05                	jmp    80491fa <print_msg>

080491f5 <dispatch_sign.neg>:
 80491f5:	b8 2c c0 04 08       	mov    eax,0x804c02c

080491fa <print_msg>:
 80491fa:	e8 1c 02 00 00       	call   804941b <io_print_string>
 80491ff:	e8 4a 02 00 00       	call   804944e <io_newline>
 8049204:	c3                   	ret

08049205 <main>:
 8049205:	b8 ff ff ff ff       	mov    eax,0xffffffff
 804920a:	e8 d1 ff ff ff       	call   80491e0 <dispatch_sign>
 804920f:	31 c0                	xor    eax,eax
 8049211:	c3                   	ret

08049212 <get_stdin>:
 8049212:	55                   	push   ebp
 8049213:	89 e5                	mov    ebp,esp
 8049215:	a1 60 c0 04 08       	mov    eax,ds:0x804c060
 804921a:	5d                   	pop    ebp
 804921b:	c3                   	ret

0804921c <get_stdout>:
 804921c:	55                   	push   ebp
 804921d:	89 e5                	mov    ebp,esp
 804921f:	a1 64 c0 04 08       	mov    eax,ds:0x804c064
 8049224:	5d                   	pop    ebp
 8049225:	c3                   	ret

08049226 <io_get_dec>:
 8049226:	57                   	push   edi
 8049227:	8d 7c 24 08          	lea    edi,[esp+0x8]
 804922b:	83 e4 f0             	and    esp,0xfffffff0
 804922e:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 8049231:	55                   	push   ebp
 8049232:	89 e5                	mov    ebp,esp
 8049234:	57                   	push   edi
 8049235:	83 ec 14             	sub    esp,0x14
 8049238:	65 a1 14 00 00 00    	mov    eax,gs:0x14
 804923e:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 8049241:	31 c0                	xor    eax,eax
 8049243:	83 ec 08             	sub    esp,0x8
 8049246:	8d 45 f0             	lea    eax,[ebp-0x10]
 8049249:	50                   	push   eax
 804924a:	68 08 a0 04 08       	push   0x804a008
 804924f:	e8 4c fe ff ff       	call   80490a0 <__isoc99_scanf@plt>
 8049254:	83 c4 10             	add    esp,0x10
 8049257:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 804925a:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 804925d:	65 2b 15 14 00 00 00 	sub    edx,DWORD PTR gs:0x14
 8049264:	74 05                	je     804926b <io_get_dec+0x45>
 8049266:	e8 15 fe ff ff       	call   8049080 <__stack_chk_fail@plt>
 804926b:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 804926e:	c9                   	leave
 804926f:	8d 67 f8             	lea    esp,[edi-0x8]
 8049272:	5f                   	pop    edi
 8049273:	c3                   	ret

08049274 <io_get_udec>:
 8049274:	57                   	push   edi
 8049275:	8d 7c 24 08          	lea    edi,[esp+0x8]
 8049279:	83 e4 f0             	and    esp,0xfffffff0
 804927c:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 804927f:	55                   	push   ebp
 8049280:	89 e5                	mov    ebp,esp
 8049282:	57                   	push   edi
 8049283:	83 ec 14             	sub    esp,0x14
 8049286:	65 a1 14 00 00 00    	mov    eax,gs:0x14
 804928c:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 804928f:	31 c0                	xor    eax,eax
 8049291:	83 ec 08             	sub    esp,0x8
 8049294:	8d 45 f0             	lea    eax,[ebp-0x10]
 8049297:	50                   	push   eax
 8049298:	68 0b a0 04 08       	push   0x804a00b
 804929d:	e8 fe fd ff ff       	call   80490a0 <__isoc99_scanf@plt>
 80492a2:	83 c4 10             	add    esp,0x10
 80492a5:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 80492a8:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 80492ab:	65 2b 15 14 00 00 00 	sub    edx,DWORD PTR gs:0x14
 80492b2:	74 05                	je     80492b9 <io_get_udec+0x45>
 80492b4:	e8 c7 fd ff ff       	call   8049080 <__stack_chk_fail@plt>
 80492b9:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 80492bc:	c9                   	leave
 80492bd:	8d 67 f8             	lea    esp,[edi-0x8]
 80492c0:	5f                   	pop    edi
 80492c1:	c3                   	ret

080492c2 <io_get_hex>:
 80492c2:	57                   	push   edi
 80492c3:	8d 7c 24 08          	lea    edi,[esp+0x8]
 80492c7:	83 e4 f0             	and    esp,0xfffffff0
 80492ca:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 80492cd:	55                   	push   ebp
 80492ce:	89 e5                	mov    ebp,esp
 80492d0:	57                   	push   edi
 80492d1:	83 ec 14             	sub    esp,0x14
 80492d4:	65 a1 14 00 00 00    	mov    eax,gs:0x14
 80492da:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 80492dd:	31 c0                	xor    eax,eax
 80492df:	83 ec 08             	sub    esp,0x8
 80492e2:	8d 45 f0             	lea    eax,[ebp-0x10]
 80492e5:	50                   	push   eax
 80492e6:	68 0e a0 04 08       	push   0x804a00e
 80492eb:	e8 b0 fd ff ff       	call   80490a0 <__isoc99_scanf@plt>
 80492f0:	83 c4 10             	add    esp,0x10
 80492f3:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 80492f6:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 80492f9:	65 2b 15 14 00 00 00 	sub    edx,DWORD PTR gs:0x14
 8049300:	74 05                	je     8049307 <io_get_hex+0x45>
 8049302:	e8 79 fd ff ff       	call   8049080 <__stack_chk_fail@plt>
 8049307:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 804930a:	c9                   	leave
 804930b:	8d 67 f8             	lea    esp,[edi-0x8]
 804930e:	5f                   	pop    edi
 804930f:	c3                   	ret

08049310 <io_get_char>:
 8049310:	55                   	push   ebp
 8049311:	89 e5                	mov    ebp,esp
 8049313:	83 e4 f0             	and    esp,0xfffffff0
 8049316:	e8 45 fd ff ff       	call   8049060 <getchar@plt>
 804931b:	c9                   	leave
 804931c:	c3                   	ret

0804931d <io_get_string>:
 804931d:	57                   	push   edi
 804931e:	8d 7c 24 08          	lea    edi,[esp+0x8]
 8049322:	83 e4 f0             	and    esp,0xfffffff0
 8049325:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 8049328:	55                   	push   ebp
 8049329:	89 e5                	mov    ebp,esp
 804932b:	57                   	push   edi
 804932c:	83 ec 14             	sub    esp,0x14
 804932f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 8049332:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
 8049335:	a1 60 c0 04 08       	mov    eax,ds:0x804c060
 804933a:	83 ec 04             	sub    esp,0x4
 804933d:	50                   	push   eax
 804933e:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 8049341:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 8049344:	e8 27 fd ff ff       	call   8049070 <fgets@plt>
 8049349:	83 c4 10             	add    esp,0x10
 804934c:	90                   	nop
 804934d:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 8049350:	c9                   	leave
 8049351:	8d 67 f8             	lea    esp,[edi-0x8]
 8049354:	5f                   	pop    edi
 8049355:	c3                   	ret

08049356 <io_print_dec>:
 8049356:	57                   	push   edi
 8049357:	8d 7c 24 08          	lea    edi,[esp+0x8]
 804935b:	83 e4 f0             	and    esp,0xfffffff0
 804935e:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 8049361:	55                   	push   ebp
 8049362:	89 e5                	mov    ebp,esp
 8049364:	57                   	push   edi
 8049365:	83 ec 14             	sub    esp,0x14
 8049368:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 804936b:	83 ec 08             	sub    esp,0x8
 804936e:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 8049371:	68 08 a0 04 08       	push   0x804a008
 8049376:	e8 d5 fc ff ff       	call   8049050 <printf@plt>
 804937b:	83 c4 10             	add    esp,0x10
 804937e:	90                   	nop
 804937f:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 8049382:	c9                   	leave
 8049383:	8d 67 f8             	lea    esp,[edi-0x8]
 8049386:	5f                   	pop    edi
 8049387:	c3                   	ret

08049388 <io_print_udec>:
 8049388:	57                   	push   edi
 8049389:	8d 7c 24 08          	lea    edi,[esp+0x8]
 804938d:	83 e4 f0             	and    esp,0xfffffff0
 8049390:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 8049393:	55                   	push   ebp
 8049394:	89 e5                	mov    ebp,esp
 8049396:	57                   	push   edi
 8049397:	83 ec 14             	sub    esp,0x14
 804939a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 804939d:	83 ec 08             	sub    esp,0x8
 80493a0:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 80493a3:	68 0b a0 04 08       	push   0x804a00b
 80493a8:	e8 a3 fc ff ff       	call   8049050 <printf@plt>
 80493ad:	83 c4 10             	add    esp,0x10
 80493b0:	90                   	nop
 80493b1:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 80493b4:	c9                   	leave
 80493b5:	8d 67 f8             	lea    esp,[edi-0x8]
 80493b8:	5f                   	pop    edi
 80493b9:	c3                   	ret

080493ba <io_print_hex>:
 80493ba:	57                   	push   edi
 80493bb:	8d 7c 24 08          	lea    edi,[esp+0x8]
 80493bf:	83 e4 f0             	and    esp,0xfffffff0
 80493c2:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 80493c5:	55                   	push   ebp
 80493c6:	89 e5                	mov    ebp,esp
 80493c8:	57                   	push   edi
 80493c9:	83 ec 14             	sub    esp,0x14
 80493cc:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 80493cf:	83 ec 08             	sub    esp,0x8
 80493d2:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 80493d5:	68 0e a0 04 08       	push   0x804a00e
 80493da:	e8 71 fc ff ff       	call   8049050 <printf@plt>
 80493df:	83 c4 10             	add    esp,0x10
 80493e2:	90                   	nop
 80493e3:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 80493e6:	c9                   	leave
 80493e7:	8d 67 f8             	lea    esp,[edi-0x8]
 80493ea:	5f                   	pop    edi
 80493eb:	c3                   	ret

080493ec <io_print_char>:
 80493ec:	57                   	push   edi
 80493ed:	8d 7c 24 08          	lea    edi,[esp+0x8]
 80493f1:	83 e4 f0             	and    esp,0xfffffff0
 80493f4:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 80493f7:	55                   	push   ebp
 80493f8:	89 e5                	mov    ebp,esp
 80493fa:	57                   	push   edi
 80493fb:	83 ec 14             	sub    esp,0x14
 80493fe:	88 45 f4             	mov    BYTE PTR [ebp-0xc],al
 8049401:	0f be 45 f4          	movsx  eax,BYTE PTR [ebp-0xc]
 8049405:	83 ec 0c             	sub    esp,0xc
 8049408:	50                   	push   eax
 8049409:	e8 82 fc ff ff       	call   8049090 <putchar@plt>
 804940e:	83 c4 10             	add    esp,0x10
 8049411:	90                   	nop
 8049412:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 8049415:	c9                   	leave
 8049416:	8d 67 f8             	lea    esp,[edi-0x8]
 8049419:	5f                   	pop    edi
 804941a:	c3                   	ret

0804941b <io_print_string>:
 804941b:	57                   	push   edi
 804941c:	8d 7c 24 08          	lea    edi,[esp+0x8]
 8049420:	83 e4 f0             	and    esp,0xfffffff0
 8049423:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 8049426:	55                   	push   ebp
 8049427:	89 e5                	mov    ebp,esp
 8049429:	57                   	push   edi
 804942a:	83 ec 14             	sub    esp,0x14
 804942d:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 8049430:	a1 64 c0 04 08       	mov    eax,ds:0x804c064
 8049435:	83 ec 08             	sub    esp,0x8
 8049438:	50                   	push   eax
 8049439:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 804943c:	e8 6f fc ff ff       	call   80490b0 <fputs@plt>
 8049441:	83 c4 10             	add    esp,0x10
 8049444:	90                   	nop
 8049445:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 8049448:	c9                   	leave
 8049449:	8d 67 f8             	lea    esp,[edi-0x8]
 804944c:	5f                   	pop    edi
 804944d:	c3                   	ret

0804944e <io_newline>:
 804944e:	57                   	push   edi
 804944f:	8d 7c 24 08          	lea    edi,[esp+0x8]
 8049453:	83 e4 f0             	and    esp,0xfffffff0
 8049456:	ff 77 fc             	push   DWORD PTR [edi-0x4]
 8049459:	55                   	push   ebp
 804945a:	89 e5                	mov    ebp,esp
 804945c:	57                   	push   edi
 804945d:	83 ec 04             	sub    esp,0x4
 8049460:	83 ec 0c             	sub    esp,0xc
 8049463:	6a 0a                	push   0xa
 8049465:	e8 26 fc ff ff       	call   8049090 <putchar@plt>
 804946a:	83 c4 10             	add    esp,0x10
 804946d:	90                   	nop
 804946e:	8b 7d fc             	mov    edi,DWORD PTR [ebp-0x4]
 8049471:	c9                   	leave
 8049472:	8d 67 f8             	lea    esp,[edi-0x8]
 8049475:	5f                   	pop    edi
 8049476:	c3                   	ret

08049477 <unbuffer_stdout>:
 8049477:	55                   	push   ebp
 8049478:	89 e5                	mov    ebp,esp
 804947a:	83 ec 08             	sub    esp,0x8
 804947d:	a1 64 c0 04 08       	mov    eax,ds:0x804c064
 8049482:	83 ec 08             	sub    esp,0x8
 8049485:	6a 00                	push   0x0
 8049487:	50                   	push   eax
 8049488:	e8 a3 fb ff ff       	call   8049030 <setbuf@plt>
 804948d:	83 c4 10             	add    esp,0x10
 8049490:	90                   	nop
 8049491:	c9                   	leave
 8049492:	c3                   	ret

Disassembly of section .fini:

08049494 <_fini>:
 8049494:	53                   	push   ebx
 8049495:	83 ec 08             	sub    esp,0x8
 8049498:	e8 73 fc ff ff       	call   8049110 <__x86.get_pc_thunk.bx>
 804949d:	81 c3 57 2b 00 00    	add    ebx,0x2b57
 80494a3:	83 c4 08             	add    esp,0x8
 80494a6:	5b                   	pop    ebx
 80494a7:	c3                   	ret
